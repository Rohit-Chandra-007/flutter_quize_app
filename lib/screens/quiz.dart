

import 'package:flutter/material.dart';
import 'package:flutter_quize_app/screens/question_screens.dart';
import 'package:flutter_quize_app/screens/starting_screen.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizWidgetScreenState();
}

class _QuizWidgetScreenState extends State<QuizApp> {



  Widget? activeScreen;

  @override
  void initState() {
    activeScreen =  StartingScreen(switchScreen);
    super.initState();
  }

  void switchScreen(){
    setState(() {
      activeScreen=const QuestionScreen();
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 26, 2, 80),
                Color.fromARGB(255, 45, 7, 98),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
