import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child:   const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text('You answered X out of Y question correctly!'),
          SizedBox(
              height: 40,
            ),
          Text('List of answered Questions...'),
          ],
        ),
      ),
    );
  }
}
