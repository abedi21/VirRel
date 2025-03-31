import 'package:flutter/material.dart';
import '../../widgets/exercise_card.dart';
import 'strength_training_screen.dart';
import 'stretching_screen.dart';
import 'yoga_screen.dart';

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
            return GestureDetector(
  onTap: () {
  String title = exercises[index]["title"]!;
  if (title == "Strength Training") {
    Navigator.push(context, MaterialPageRoute(builder: (_) => StrengthTrainingScreen()));
  } else if (title == "Stretching") {
    Navigator.push(context, MaterialPageRoute(builder: (_) => StretchingScreen()));
  } else if (title == "Yoga") {
    Navigator.push(context, MaterialPageRoute(builder: (_) => YogaScreen()));
  }
},

  child: ExerciseCard(
    title: exercises[index]["title"]!,
    image: exercises[index]["image"]!,
  ),
);

          },
        ),
      ),
    );
  }
}
