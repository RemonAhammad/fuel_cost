import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../models/fuel_unit.dart';

class FuelSummaryCard extends StatelessWidget {
  final String currency;
  final double liters;
  final FuelUnit unit;
  final double pricePerLiter;
  final double? estimatedMileage;

  const FuelSummaryCard({
    super.key,
    required this.currency,
    required this.liters,
    this.unit = FuelUnit.liter,
    required this.pricePerLiter,
    this.estimatedMileage,
  });

  @override
  Widget build(BuildContext context) {
    final totalCost = liters * pricePerLiter;

    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withValues(alpha: 0.2), width: 1),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 20, offset: const Offset(0, 10))],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.receipt, color: Colors.white, size: 24),
              SizedBox(width: 8),
              Text(
                AppLocalizations.of(context).summaryFillUpTitle,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(AppLocalizations.of(context).commonTotalCost, style: TextStyle(color: Colors.white70, fontSize: 14)),
                  const SizedBox(height: 4),
                  Text(
                    '$currency${totalCost.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ],
              ),
              if (estimatedMileage != null) ...[
                Container(width: 1, height: 20, color: Colors.white30),
                Column(
                  children: [
                    Text(AppLocalizations.of(context).commonMileage, style: TextStyle(color: Colors.white70, fontSize: 14)),
                    const SizedBox(height: 4),
                    Text(
                      '${estimatedMileage!.toStringAsFixed(1)} ${unit.efficiencyLabel}',
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
