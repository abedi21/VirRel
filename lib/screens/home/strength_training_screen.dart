import 'package:flutter/material.dart';

class StrengthTrainingScreen extends StatelessWidget {
  final List<Map<String, String>> exercises = [
    {
      "title": "Push-Ups",
      "target": "Chest, Triceps",
    },
    {
      "title": "Squats",
      "target": "Quadriceps, Glutes",
    },
    {
      "title": "Lunges",
      "target": "Hamstrings, Glutes",
    },
    {
      "title": "Plank",
      "target": "Core",
    },
    {
      "title": "Shoulder Press (Dumbbell)",
      "target": "Shoulders, Triceps",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Strength Training")),
      body: ListView.builder(
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          final exercise = exercises[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              title: Text(
                exercise['title']!,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Text("Target: ${exercise['target']}"),
              leading: Icon(Icons.fitness_center, color: Colors.blue),
            ),
          );
        },
      ),
    );
  }
}
