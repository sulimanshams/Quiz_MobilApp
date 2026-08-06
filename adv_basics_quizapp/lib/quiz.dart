import 'package:flutter/material.dart';
import 'start_Screen.dart';
import 'questions_screen.dart';

class Quiz extends StatefulWidget {
 const Quiz({super.key});
@override
  State<Quiz> createState(){
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = "start-screen";


  //  @override
  // initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }


  void switchScreen(){
    setState(() {
      activeScreen = "questions-screen";
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen == "start-screen"
              ? StartScreen(switchScreen)
              : const QuestionsScreen(),
        ),
      ),
    );
  }
}
