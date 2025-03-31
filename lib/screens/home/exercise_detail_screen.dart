import 'package:flutter/material.dart';

class ExerciseDetailScreen extends StatelessWidget {
  final String name;
  final String description;
  final String reps;
  final String sets;
  final List<String> steps;

  const ExerciseDetailScreen({
    super.key,
    required this.name,
    required this.description,
    required this.reps,
    required this.sets,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Text(
              description,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 12),
            Text("Sets: $sets", style: const TextStyle(fontSize: 16)),
            Text("Reps: $reps", style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            const Text("Steps:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            ...steps.map((step) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text("• $step", style: const TextStyle(fontSize: 16)),
            )),
          ],
        ),
      ),
    );
  }
}
