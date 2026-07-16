import 'package:flutter/material.dart';

class IngredientRow extends StatelessWidget {
  final String ingredientName;
  final TextEditingController quantityController;
  final TextEditingController priceController;

  const IngredientRow({
    super.key,
    required this.ingredientName,
    required this.quantityController,
    required this.priceController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ingredientName,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: quantityController,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                    labelText: "Qty (Kg)",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.scale),
                  ),
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: TextField(
                  controller: priceController,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                    labelText: "Price (৳)",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.currency_exchange),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}