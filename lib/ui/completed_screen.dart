import 'package:flutter/material.dart';

class QuizCompletedScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final Function() onRestartQuiz;

  const QuizCompletedScreen({
    super.key,
    required this.score,
    required this.totalQuestions,
    required this.onRestartQuiz,
  });

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text(
        'Quiz Completed!',
        style: TextStyle(fontSize: 24),
      ),
      const SizedBox(height: 16),
      Text(
        'Score: $score / $totalQuestions',
        style: const TextStyle(fontSize: 20),
      ),
      const SizedBox(height: 26),
      ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
        onPressed: onRestartQuiz,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
          child: Text(
            'Restart Quiz',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    ]);
  }
}
