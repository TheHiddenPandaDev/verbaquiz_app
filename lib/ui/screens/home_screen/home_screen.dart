import 'package:flutter/material.dart';
import 'package:verbaquiz/ui/screens/quiz_screen/quiz_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';

  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text('Home'),
          ),
          const SizedBox(height: 50),
          TextButton(
            onPressed: () => Navigator.of(context).pushNamed(QuizScreen.routeName),
            child: const Text('Go To Quiz'),
          ),
        ],
      ),
    );
  }
}
