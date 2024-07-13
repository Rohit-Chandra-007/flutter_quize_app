import 'package:flutter/material.dart';
import 'package:flutter_quize_app/data/dummy_list.dart';
import 'package:flutter_quize_app/screens/question_screens.dart';
import 'package:flutter_quize_app/screens/result_screen.dart';
import 'package:flutter_quize_app/screens/starting_screen.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizWidgetScreenState();
}

class _QuizWidgetScreenState extends State<QuizApp> {
  String activeScreen = 'starting-screen';
  List<String> selectedAnswers = [];

  void switchScreenFunction() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void onRestartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        //selectedAnswers = [];
        activeScreen = 'result-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartingScreen(switchScreenFunction);

    if (activeScreen == 'question-screen') {
      screenWidget = QuestionScreen(onSelectedAnswer: chooseAnswer);
    }

    if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(
        choosenAnswer: selectedAnswers,
        onRestart: onRestartQuiz,
      );
    }
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
          child: screenWidget,
        ),
      ),
    );
  }
}
