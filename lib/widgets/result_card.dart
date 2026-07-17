import 'package:flutter/material.dart';

class ResultCard extends StatelessWidget {
  final double totalWeight;
  final double totalCost;
  final double costPerKg;

  const ResultCard({
    super.key,
    required this.totalWeight,
    required this.totalCost,
    required this.costPerKg,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "📦 Total Weight : ${totalWeight.toStringAsFixed(2)} Kg",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              "💰 Total Cost : ৳${totalCost.toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              "🏷 Cost / Kg : ৳${costPerKg.toStringAsFixed(2)}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}