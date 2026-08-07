import 'package:adv_basics_quizapp/answer_button.dart';
import 'package:flutter/material.dart';
import "package:adv_basics_quizapp/data/questions.dart";

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentquestionIndex = 0;

  void answerQuestion() {
    setState(() {
      currentquestionIndex = currentquestionIndex + 1;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentquestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              // "The question text will go here!",
              style: TextStyle(color: Colors.white, fontSize: 14),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(answer, answerQuestion);
            }),
            // AnswerButton(currentQuestion.answers[0], () {}),
            // AnswerButton(currentQuestion.answers[1], () {}),
            // AnswerButton(currentQuestion.answers[2], () {}),
            // AnswerButton(currentQuestion.answers[3], () {}),

            // ElevatedButton(
            //   onPressed: () {},
            //   child: Text("Answer 1"),
            //   ),

            //    ElevatedButton(
            //   onPressed: () {},
            //   child: Text("Answer 2"),
            //   ),

            //    ElevatedButton(
            //   onPressed: () {},
            //   child: Text("Answer 3"),
            //   ),

            //    ElevatedButton(
            //   onPressed: () {},
            //   child: Text("Answer 4"),
            //   ),
          ],
        ),
      ),
    );
  }
}
