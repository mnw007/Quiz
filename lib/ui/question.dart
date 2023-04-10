import 'package:flutter/material.dart';

class QuizQuestion extends StatelessWidget {
  final int currentQuestionIndex;
  final List<String> questions;
  final List<List<String>> options;
  final Function(String) onOptionSelected;

  const QuizQuestion({
    super.key,
    required this.currentQuestionIndex,
    required this.questions,
    required this.options,
    required this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Question ${currentQuestionIndex + 1}',
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 16),
          Text(
            questions[currentQuestionIndex],
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 40),
          Column(
            children: options[currentQuestionIndex]
                .map(
                  (option) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => onOptionSelected(option),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                option,
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
