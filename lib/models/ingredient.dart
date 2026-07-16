import 'package:flutter/material.dart';

class Ingredient {
  final String name;
  final IconData icon;

  final TextEditingController quantityController =
      TextEditingController();

  final TextEditingController priceController =
      TextEditingController();

  Ingredient({
    required this.name,
    required this.icon,
  });
}