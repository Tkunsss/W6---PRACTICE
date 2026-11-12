
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Main Stateless Widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: const Text("My Hobbies"),
          backgroundColor: Colors.white,
        ),
        body: const Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              // Travelling Container
              HobbyCard(
                hobby: "Travelling",
                icon: Icons.travel_explore,
                color: Colors.green,
              ),

              // Skating Container
              HobbyCard(
                hobby: "Skating",
                icon: Icons.skateboarding,
                color: Colors.blue,
              ),

            ],
          ),
        ),
      ),
    );
  }
}

// Reusable Stateless Widget
class HobbyCard extends StatelessWidget {
  final String hobby;
  final IconData icon;
  final Color color;

  const HobbyCard({
    super.key,
    required this.hobby,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(100),
      margin: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.all(30),
          ),
          Icon(
            icon,
            size: 40,
            color: Colors.white,
          ),
          const SizedBox(width: 20),
          const Padding(
            padding: EdgeInsets.all(20),
          ),
          Text(
            hobby,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
