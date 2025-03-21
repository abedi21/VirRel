import 'package:flutter/material.dart';
import '../../widgets/exercise_card.dart';

class ExercisesScreen extends StatelessWidget {
  final List<Map<String, String>> exercises = [
    {"title": "Stretching", "image": "assets/images/exercise1.jpg"},
    {"title": "Yoga", "image": "assets/images/exercise2.jpg"},
    {"title": "Strength Training", "image": "assets/images/exercise3.jpg"},
  ];

  ExercisesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Exercises")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: exercises.length,
          itemBuilder: (context, index) {
            return ExerciseCard(
              title: exercises[index]["title"]!,
              image: exercises[index]["image"]!,
            );
          },
        ),
      ),
    );
  }
}
