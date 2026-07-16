import 'package:flutter/material.dart';

class IngredientTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const IngredientTextField({
    super.key,
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        controller: controller,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          prefixIcon: const Icon(Icons.grass),
        ),
      ),
    );
  }
}