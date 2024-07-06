import 'package:flutter/material.dart';

class StartingScreen extends StatelessWidget {
  const StartingScreen(this.switchScreenFunc, {super.key});

 final void Function() switchScreenFunc;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Opacity(
            opacity: 0.5,
            child: Image.asset(
              'assets/images/quiz-logo.png',
              width: 300.0,
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          const Opacity(
            opacity: 0.5,
            child: Text(
              'Learn Flutter the fun Way',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            icon: const Icon(
              Icons.arrow_right_alt,
              color: Colors.white,
            ),
            label: const Text('Start Quiz'),
            onPressed: switchScreenFunc,
            style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                )),
          ),
        ],
      ),
    );
  }
}