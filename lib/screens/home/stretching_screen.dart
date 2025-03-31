import 'package:flutter/material.dart';

class StretchingScreen extends StatelessWidget {
  final List<Map<String, String>> stretchingExercises = [
    {
      "title": "Neck Stretch",
      "muscle": "Neck",
    },
    {
      "title": "Hamstring Stretch",
      "muscle": "Hamstrings",
    },
    {
      "title": "Quad Stretch",
      "muscle": "Quadriceps",
    },
    {
      "title": "Shoulder Stretch",
      "muscle": "Shoulders",
    },
    {
      "title": "Lower Back Stretch",
      "muscle": "Lower Back",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stretching")),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: stretchingExercises.length,
        itemBuilder: (context, index) {
          final exercise = stretchingExercises[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: Icon(Icons.accessibility_new, color: Colors.green),
              title: Text(exercise["title"]!,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("Target: ${exercise["muscle"]}"),
            ),
          );
        },
      ),
    );
  }
}
