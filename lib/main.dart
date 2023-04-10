import 'package:flutter/material.dart';
import 'package:krishify_quiz/ui/completed_screen.dart';
import 'package:krishify_quiz/ui/question.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green,
        fontFamily: 'Roboto',
        appBarTheme: const AppBarTheme(
          color: Colors.green,
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Colors.orange,
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> questions = [
    'भारत में गन्ने का सबसे बड़ा उत्पादक राज्य कौन सा है?',
    'What is the largest planet in our solar system?',
    'What is the currency of Japan?',
  ];

  List<List<String>> options = [
    ['बिहार', 'महाराष्ट्र', 'उत्तर प्रदेश', 'गुजरात'],
    ['Jupiter', 'Saturn', 'Mars', 'Neptune'],
    ['Yen', 'Won', 'Euro', 'Dollar'],
  ];

  List<String> answers = [
    'उत्तर प्रदेश',
    'Jupiter',
    'Yen',
  ];

  int currentQuestionIndex = 0;
  int score = 0;

  void checkAnswer(String selectedOption) {
    String correctAnswer = answers[currentQuestionIndex];
    setState(() {
      if (selectedOption == correctAnswer) {
        score++;
      }
      currentQuestionIndex++;
    });
  }

  void resetQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text('Krishify Quiz'),
        ),
        body: Center(
            child: currentQuestionIndex < questions.length
                ? QuizQuestion(
                    currentQuestionIndex: currentQuestionIndex,
                    questions: questions,
                    options: options,
                    onOptionSelected: checkAnswer)
                : QuizCompletedScreen(
                    score: score,
                    totalQuestions: questions.length,
                    onRestartQuiz: resetQuiz)),
      ),
    );
  }
}
