import 'package:flutter/material.dart';

class FormulaManagerScreen extends StatefulWidget {
  const FormulaManagerScreen({super.key});

  @override
  State<FormulaManagerScreen> createState() =>
      _FormulaManagerScreenState();
}

class _FormulaManagerScreenState
    extends State<FormulaManagerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formula Manager"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text(
          "No Formula Added",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}