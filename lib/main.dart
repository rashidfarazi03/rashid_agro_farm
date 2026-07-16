import 'package:flutter/material.dart';
import 'screens/poultry_screen.dart';
import 'screens/pigeon_screen.dart';
import 'screens/duck_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RASHID AGRO FARM',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: const Text('RASHID AGRO FARM'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.agriculture,
                size: 70,
                color: Colors.green,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'RASHID AGRO FARM',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'WELCOME',
              style: TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 30),

            Card(
              elevation: 8,
              child: ListTile(
                leading: const Icon(
                  Icons.agriculture,
                  color: Colors.green,
                ),
                title: const Text('POULTRY'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PoultryScreen(),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 15),

            Card(
              elevation: 8,
              child: ListTile(
                leading: const Icon(
                  Icons.flutter_dash,
                  color: Colors.blue,
                ),
                title: const Text('PIGEON'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const PigeonScreen(),
    ),
  );
},
              ),
            ),

            const SizedBox(height: 15),

            Card(
              elevation: 8,
              child: ListTile(
                leading: const Icon(
                  Icons.egg,
                  color: Colors.orange,
                ),
                title: const Text('DUCK'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const DuckScreen(),
    ),
  );
},
              ),
            ),
          ],
        ),
      ),
    );
  }
}