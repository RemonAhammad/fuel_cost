import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'backup_data_service.dart';

class DriveBackupService {
  /// v2 backup: fuel entries + vehicles + entry-vehicle mapping.
  static const String _backupFileName = 'fuel_cost_backup.json';

  /// v1 backup: fuel entries only. Still readable on restore, never written.
  static const String _legacyBackupFileName = 'fuel_cost_backup.csv';

  static const String _lastBackupTimeKey = 'last_drive_backup_time';

  /// Drive file id of the v2 backup. Deliberately a different key from the v1
  /// 'drive_backup_file_id' — reusing that would make files.update overwrite
  /// the user's CSV backup with JSON content under a .csv name.
  static const String _driveFileIdKey = 'drive_backup_json_file_id';
  static const String _autoBackupKey = 'auto_backup_enabled';

  static Future<bool> isAutoBackupEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_autoBackupKey) ?? false;
  }

  static Future<void> setAutoBackup(bool enabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_autoBackupKey, enabled);
  }

  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [drive.DriveApi.driveAppdataScope],
  );

  // --- Connectivity Check ---

  static Future<bool> _hasInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com')
          .timeout(const Duration(seconds: 5));
      return result.isNotEmpty && result.first.rawAddress.isNotEmpty;
    } catch (_) {
      return false;
    }
  }

  static String _friendlySignInError(dynamic e) {
    final msg = e.toString();
    // Parse ApiException error codes
    if (msg.contains('ApiException: 7') || msg.contains('NETWORK_ERROR')) {
      return 'No internet connection. Check your connection and try again.';
    } else if (msg.contains('ApiException: 10') || msg.contains('DEVELOPER_ERROR')) {
      return 'Google Sign-In configuration error. Please update the app.';
    } else if (msg.contains('ApiException: 12501') || msg.contains('SIGN_IN_CANCELLED')) {
      return 'Sign-in cancelled.';
    } else if (msg.contains('ApiException: 12500') || msg.contains('SIGN_IN_FAILED')) {
      return 'Google Sign-In failed. Please try again.';
    } else if (msg.contains('ApiException: 4')) {
      return 'Google Sign-In required. Please try again.';
    } else if (msg.contains('network') || msg.contains('Network')) {
      return 'Network error. Check your internet connection.';
    }
    return 'Google Sign-In failed. Please try again.';
  }

  // --- Sign-In ---

  static Future<GoogleSignInAccount?> signIn() async {
    final hasInternet = await _hasInternet();
    if (!hasInternet) {
      throw Exception('No internet connection. Check your connection and try again.');
    }
    try {
      return await _googleSignIn.signIn();
    } on PlatformException catch (e) {
      print('Google Sign-In PlatformException: code=${e.code}, message=${e.message}, details=${e.details}');
      throw Exception(_friendlySignInError(e.message ?? e.code));
    } catch (e) {
      print('Google Sign-In error: $e');
      throw Exception(_friendlySignInError(e));
    }
  }

  static Future<void> signOut() async {
    await _googleSignIn.signOut();
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_driveFileIdKey);
    await prefs.remove('drive_backup_file_id'); // stale v1 id
    await prefs.remove(_lastBackupTimeKey);
  }

  static Future<bool> isSignedIn() async {
    try {
      return _googleSignIn.currentUser != null ||
          await _googleSignIn.signInSilently() != null;
    } catch (e) {
      print('Google Sign-In check failed: $e');
      return false;
    }
  }

  static GoogleSignInAccount? get currentUser => _googleSignIn.currentUser;

  // --- Authenticated Drive Client ---

  static Future<drive.DriveApi> _getDriveApi() async {
    final account =
        _googleSignIn.currentUser ?? await _googleSignIn.signInSilently();
    if (account == null) throw Exception('Not signed in to Google');

    final authClient = await _googleSignIn.authenticatedClient();
    if (authClient == null) {
      throw Exception('Failed to get authenticated client');
    }

    return drive.DriveApi(authClient);
  }

  // --- Backup (Upload) ---

  static Future<void> backupToDrive() async {
    final driveApi = await _getDriveApi();
    final jsonContent = await BackupDataService.buildBackupJson();
    final bytes = utf8.encode(jsonContent);
    final media = drive.Media(Stream.value(bytes), bytes.length);

    final prefs = await SharedPreferences.getInstance();
    final existingFileId = prefs.getString(_driveFileIdKey);

    if (existingFileId != null) {
      try {
        // Update existing file
        await driveApi.files.update(
          drive.File()..name = _backupFileName,
          existingFileId,
          uploadMedia: media,
        );
      } catch (e) {
        // File might have been deleted, clear stored ID and create new
        print('Update failed, creating new file: $e');
        await prefs.remove(_driveFileIdKey);
        await _createNewBackup(driveApi, media, prefs);
      }
    } else {
      await _createNewBackup(driveApi, media, prefs);
    }

    await _setLastBackupTime();
  }

  static Future<void> _createNewBackup(
    drive.DriveApi driveApi,
    drive.Media media,
    SharedPreferences prefs,
  ) async {
    final driveFile = drive.File()
      ..name = _backupFileName
      ..parents = ['appDataFolder'];
    final result = await driveApi.files.create(driveFile, uploadMedia: media);
    if (result.id != null) {
      await prefs.setString(_driveFileIdKey, result.id!);
    }
  }

  // --- Restore (Download) ---

  /// Downloads the backup and works out what restoring it would change.
  /// Writes nothing — pass the result to [BackupDataService.applyRestore]
  /// once any conflicts have been resolved.
  static Future<RestorePreview> fetchRestorePreview() async {
    final driveApi = await _getDriveApi();

    // Prefer the v2 JSON backup; fall back to a v1 CSV left by an older build.
    var fileId = await _findBackupFileId(driveApi, _backupFileName);
    final isLegacy = fileId == null;
    fileId ??= await _findBackupFileId(driveApi, _legacyBackupFileName);

    if (fileId == null) {
      throw Exception('No backup found on Google Drive');
    }

    final content = await _downloadFile(driveApi, fileId);

    return isLegacy
        ? await BackupDataService.analyzeLegacyCsv(content)
        : await BackupDataService.analyzeJson(content);
  }

  static Future<String?> _findBackupFileId(
    drive.DriveApi driveApi,
    String name,
  ) async {
    final fileList = await driveApi.files.list(
      spaces: 'appDataFolder',
      q: "name = '$name'",
      $fields: 'files(id, name, modifiedTime)',
    );
    if (fileList.files == null || fileList.files!.isEmpty) return null;
    return fileList.files!.first.id;
  }

  static Future<String> _downloadFile(
    drive.DriveApi driveApi,
    String fileId,
  ) async {
    final media = await driveApi.files.get(
      fileId,
      downloadOptions: drive.DownloadOptions.fullMedia,
    ) as drive.Media;

    final bytes = <int>[];
    await for (final chunk in media.stream) {
      bytes.addAll(chunk);
    }
    return utf8.decode(bytes);
  }

  // --- Metadata ---

  static Future<DateTime?> getLastBackupTime() async {
    final prefs = await SharedPreferences.getInstance();
    final timeStr = prefs.getString(_lastBackupTimeKey);
    if (timeStr != null) {
      return DateTime.tryParse(timeStr);
    }
    return null;
  }

  static Future<DateTime?> getRemoteBackupTime() async {
    try {
      final driveApi = await _getDriveApi();
      for (final name in [_backupFileName, _legacyBackupFileName]) {
        final fileList = await driveApi.files.list(
          spaces: 'appDataFolder',
          q: "name = '$name'",
          $fields: 'files(id, modifiedTime)',
        );
        if (fileList.files != null && fileList.files!.isNotEmpty) {
          return fileList.files!.first.modifiedTime;
        }
      }
    } catch (e) {
      print('Failed to get remote backup time: $e');
    }
    return null;
  }

  static Future<void> _setLastBackupTime() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _lastBackupTimeKey,
      DateTime.now().toIso8601String(),
    );
  }
}
