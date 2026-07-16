import 'package:flutter/material.dart';
import 'feed_calculator_screen.dart';

class PoultryScreen extends StatelessWidget {
  const PoultryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("POULTRY"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),

            const Icon(
              Icons.agriculture,
              size: 80,
              color: Colors.green,
            ),

            const SizedBox(height: 15),

            const Center(
              child: Text(
                "POULTRY MANAGEMENT",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 40),

            ElevatedButton(
              onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => FeedCalculatorScreen(),
    ),
  );
},
              child: const Text("FEED CALCULATOR"),
            ),

            const SizedBox(height: 15),

            ElevatedButton(
              onPressed: () {},
              child: const Text("MEDICINE"),
            ),

            const SizedBox(height: 15),

            ElevatedButton(
              onPressed: () {},
              child: const Text("VACCINATION"),
            ),

            const SizedBox(height: 15),

            ElevatedButton(
              onPressed: () {},
              child: const Text("GROWTH RECORD"),
            ),

            const SizedBox(height: 15),

            ElevatedButton(
              onPressed: () {},
              child: const Text("EXPENSE RECORD"),
            ),
          ],
        ),
      ),
    );
  }
}