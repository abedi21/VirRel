import 'package:flutter/material.dart';
import 'exercise_detail_screen.dart';

class StrengthTrainingScreen extends StatelessWidget {
  const StrengthTrainingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final exercises = [
      {
        "name": "Push-Ups",
        "description": "A classic upper body strength exercise targeting chest, triceps, and shoulders.",
        "sets": "3–4",
        "reps": "8–15",
        "steps": [
          "Start in a plank position.",
          "Lower your body until your chest nearly touches the floor.",
          "Keep your core tight and back flat.",
          "Push yourself back up to the starting position."
        ]
      },
      {
        "name": "Bodyweight Squats",
        "description": "Strengthens legs and glutes using your body weight.",
        "sets": "3–4",
        "reps": "10–20",
        "steps": [
          "Stand with feet shoulder-width apart.",
          "Bend your knees and lower your hips as if sitting on a chair.",
          "Keep your chest up and knees behind your toes.",
          "Push through your heels to return to standing."
        ]
      },
      {
        "name": "Plank",
        "description": "Core strengthening isometric exercise.",
        "sets": "3",
        "reps": "Hold for 30–60 seconds",
        "steps": [
          "Lie face down and lift your body onto your elbows and toes.",
          "Keep your body in a straight line from head to heels.",
          "Hold this position, keeping your abs tight.",
        ]
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Strength Training")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          final ex = exercises[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: ListTile(
              title: Text(ex["name"] as String),
              subtitle: Text(ex["description"] as String),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ExerciseDetailScreen(
                      name: ex["name"] as String,
description: ex["description"] as String,
reps: ex["reps"] as String,
sets: ex["sets"] as String,
steps: List<String>.from(ex["steps"] as List),

                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
