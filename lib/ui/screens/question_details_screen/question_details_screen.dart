import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:verbaquiz/domain/model/objects/question.dart';

class QuestionDetailParams {
  final Question question;

  QuestionDetailParams({
    required this.question,
  });
}

class QuestionDetailsScreen extends StatelessWidget {
  static const routeName = '/question-screen-detail-screen';

  const QuestionDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as QuestionDetailParams;
    final Question question = args.question;

    return Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.black),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    question.text,
                    style: const TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
