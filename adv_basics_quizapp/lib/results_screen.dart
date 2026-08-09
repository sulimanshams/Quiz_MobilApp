import "package:adv_basics_quizapp/data/questions.dart";
import "package:flutter/material.dart";
import "question_summary.dart";

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.choserAnswers , required this.onRestart});

  final List<String> choserAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummmryData() {
    final List<Map<String, Object>> summry = [];

    for (var i = 0; i < choserAnswers.length; i++) {
      summry.add({
        "question_index": i,
        "question": questions[i].text,
        "correct_answer": questions[i].answers[0],
        "user_answer": choserAnswers[i],
      });
    }
    return summry;
  }

  @override
  Widget build(context) {
    final summaryData = getSummmryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
        return data["user_answer"] == data["correct_answer"];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(100, 255, 255, 255),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    children: [
                      const TextSpan(text: 'You answered '),
                      TextSpan(
                        text: '$numCorrectQuestions',
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      const TextSpan(text: ' out of '),
                      TextSpan(
                        text: '$numTotalQuestions',
                        style: const TextStyle(
                          color: Colors.purpleAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      const TextSpan(text: ' questions correctly!'),
                    ],
                  ),
                ),
              ),
            SizedBox(height: 30),
            QuestionsSummary(summaryData),
            SizedBox(height: 30),
          TextButton.icon(
              onPressed: onRestart,
              icon: const Icon(Icons.refresh),
              label: const Text("Restart Quiz"),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
