import 'package:flutter/material.dart';

class YogaScreen extends StatelessWidget {
  final List<Map<String, String>> yogaExercises = [
    {
      "title": "Downward Dog",
      "muscle": "Full Body",
    },
    {
      "title": "Child's Pose",
      "muscle": "Back, Hips",
    },
    {
      "title": "Cobra Pose",
      "muscle": "Spine, Chest",
    },
    {
      "title": "Tree Pose",
      "muscle": "Legs, Core",
    },
    {
      "title": "Bridge Pose",
      "muscle": "Glutes, Spine",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Yoga")),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: yogaExercises.length,
        itemBuilder: (context, index) {
          final exercise = yogaExercises[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: Icon(Icons.self_improvement, color: Colors.purple),
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
