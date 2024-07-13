import 'package:flutter/material.dart';
import 'package:flutter_quize_app/data/dummy_list.dart';
import 'package:flutter_quize_app/widgets/question_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.choosenAnswer, required this.onRestart});
  final List<String> choosenAnswer;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryList() {
    final List<Map<String, Object>> summary = [];
    for (int i = 0; i < choosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].questionText,
        'correct_answer': questions[i].answers[0],
        'user_answer': choosenAnswer[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryList();
    final numOfTotalQuestion = questions.length;
    final numOfCorrectAnswer = summaryData.where(
      (data) {
        return data['correct_answer'] == data['user_answer'];
      },
    ).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numOfCorrectAnswer out of $numOfTotalQuestion question correctly!',
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            QuestionSummaryWidget(
              summaryData: summaryData,
            ),
            const SizedBox(
              height: 40,
            ),
            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 95, 1, 59),
                foregroundColor: Colors.amber,
              ),
              icon: const Icon(Icons.refresh),
              label: Text(
                'Restart Quiz',
                style: GoogleFonts.montserrat(
                  // color: Colors.white,
                  // fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }

 
}
