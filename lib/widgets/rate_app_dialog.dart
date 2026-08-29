import 'package:flutter/material.dart';

/// What the user chose in [RateAppDialog].
enum RateAppChoice {
  /// Send them to the platform review sheet.
  rate,

  /// Ask again after a cooldown.
  later,

  /// Never ask again.
  decline,
}

/// Gate shown before the platform review sheet, so only users who say they're
/// enjoying the app land on the store rating form.
class RateAppDialog extends StatelessWidget {
  const RateAppDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: const Row(
        children: [
          Icon(Icons.star_rounded, color: Colors.amber, size: 28),
          SizedBox(width: 12),
          Expanded(child: Text('Enjoying Fuel Cost?')),
        ],
      ),
      content: const Text(
        "You've been tracking your fuel for a while now. "
        'A quick rating helps other drivers find the app.',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, RateAppChoice.decline),
          child: const Text('No thanks'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, RateAppChoice.later),
          child: const Text('Not now'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber.shade700,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          onPressed: () => Navigator.pop(context, RateAppChoice.rate),
          child: const Text('Rate now'),
        ),
      ],
    );
  }
}
