import 'package:flutter/material.dart';
import 'exercise_detail_screen.dart';

class StretchingScreen extends StatelessWidget {
  final List<Map<String, dynamic>> stretches = [
    {
      "name": "Hamstring Stretch",
      "description": "Improves flexibility in the hamstrings.",
      "reps": "Hold for 20 seconds",
      "sets": "3 sets each leg",
      "steps": [
        "Stand upright and extend one leg forward.",
        "Keep it straight on a surface and bend forward.",
        "Feel the stretch in the back of your thigh.",
      ]
    },
    {
      "name": "Quad Stretch",
      "description": "Stretches the front thigh muscles.",
      "reps": "Hold for 30 seconds",
      "sets": "2 sets each leg",
      "steps": [
        "Stand on one foot, pull the opposite foot toward your glutes.",
        "Keep your knees close together.",
        "Hold for the set time and switch legs.",
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stretching Exercises")),
      body: ListView.builder(
        itemCount: stretches.length,
        itemBuilder: (context, index) {
          final ex = stretches[index];
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
