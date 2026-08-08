import 'package:adv_basics_quizapp/data/questions.dart';
import 'package:flutter/material.dart';
import 'start_Screen.dart';
import 'questions_screen.dart';
import 'results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = "start-screen";

  //  @override
  // initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      activeScreen = "questions-screen";
    });
  }

  void choosenAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        selectedAnswers = [];
        activeScreen = "results-screen";
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);
    
    if (activeScreen == "questions-screen") { 
      screenWidget = QuestionsScreen( onSelectAnswer: choosenAnswer, ); 
    } 
      
      if (activeScreen == "results-screen") { 
        screenWidget =  ResultsScreen(choserAnswers: selectedAnswers,);
        
       }

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
          child: screenWidget,
          // activeScreen == "start-screen"
          //     ? StartScreen(switchScreen)
          //     : QuestionsScreen(onSelectAnswer: choosenAnswer),
        ),
      ),
    );
  }
}
