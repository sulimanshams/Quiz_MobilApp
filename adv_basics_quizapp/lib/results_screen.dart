import "package:adv_basics_quizapp/data/questions.dart";
import "package:flutter/material.dart";

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.choserAnswers});

  final List<String> choserAnswers;

  List<Map<String, Object>> getSummmryData() {
    final List<Map<String, Object>> summry = [];

    for (var i = 0; i < choserAnswers.length; i++) {
      summry.add(
        {
          "question_index": i,
          "question":questions[i].text,
          "correct_answer":questions[i].answers[0],
          "user_answer": choserAnswers[i]
          
        });
    }
    return summry;
  }

  @override
  Widget build(context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You answered X out of Y questions correctly!"),
            SizedBox(height: 30),
            Text("List of answers and questions"),
            SizedBox(height: 30),
            TextButton(onPressed: () {}, child: Text("Restart Quiz")),
          ],
        ),
      ),
    );
  }
}
