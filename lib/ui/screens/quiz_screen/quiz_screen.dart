import 'package:flutter/material.dart';

class QuizScreen extends StatelessWidget {

  static const String routeName = '/quiz';

  const QuizScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Quiz')
      ],
    );
  }
}
