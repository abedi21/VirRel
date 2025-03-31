import 'package:flutter/material.dart';
import 'exercise_detail_screen.dart';

class YogaScreen extends StatelessWidget {
  final List<Map<String, dynamic>> yogaExercises = [
    {
      "name": "Downward Dog",
      "description": "A foundational yoga pose to stretch the back and hamstrings.",
      "reps": "Hold for 30 seconds",
      "sets": "3 rounds",
      "steps": [
        "Start on hands and knees.",
        "Lift your hips up and back.",
        "Straighten your legs and press heels toward floor.",
        "Keep your head relaxed and breathe deeply.",
      ]
    },
    {
      "name": "Child's Pose",
      "description": "A relaxing pose that stretches the lower back and hips.",
      "reps": "Hold for 1 minute",
      "sets": "2 rounds",
      "steps": [
        "Kneel on the floor and sit back on your heels.",
        "Stretch arms forward on the floor.",
        "Rest your forehead down and breathe deeply.",
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Yoga Exercises")),
      body: ListView.builder(
        itemCount: yogaExercises.length,
        itemBuilder: (context, index) {
          final ex = yogaExercises[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(ex["name"] as String),
              subtitle: Text(ex["description"] as String),
              trailing: Icon(Icons.arrow_forward_ios),
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
