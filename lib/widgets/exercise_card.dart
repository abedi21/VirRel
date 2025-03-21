import 'package:flutter/material.dart';

class ExerciseCard extends StatelessWidget {
  final String title, image;

  const ExerciseCard({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Image.asset(image, width: 80, height: 80, fit: BoxFit.cover),
          SizedBox(width: 15),
          Text(title, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
