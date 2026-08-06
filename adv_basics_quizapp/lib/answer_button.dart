import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  AnswerButton(this.answerText ,{super.key});

  final String answerText;

  @override
  Widget build(contxt) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(),
      child: Text(answerText),
    );
  }
}
