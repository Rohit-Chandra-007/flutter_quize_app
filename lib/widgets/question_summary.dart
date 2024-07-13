import 'package:flutter/material.dart';
import 'package:flutter_quize_app/widgets/question_identifier.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummaryWidget extends StatelessWidget {
  const QuestionSummaryWidget({
    super.key,
    required this.summaryData,
  });

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SummaryItemWidget(
                  itemData: data,
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}

class SummaryItemWidget extends StatelessWidget {
  const SummaryItemWidget({
    super.key,
    required this.itemData,
  });

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemData['correct_answer'] == itemData['user_answer'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifierWidget(
          questionIndex: itemData['question_index'] as int,
          isCorrectAnswer: isCorrectAnswer,
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemData['question'] as String,
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                itemData['correct_answer'] as String,
                style: GoogleFonts.montserrat(
                  color: Colors.purple,
                  fontSize: 14,
                ),
              ),
              // const SizedBox(
              //   height: 5,
              // ),
              Text(
                itemData['user_answer'] as String,
                style: GoogleFonts.montserrat(
                  color: Colors.blue,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
