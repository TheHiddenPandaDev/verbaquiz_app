import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:verbaquiz/domain/model/objects/quiz.dart';
import 'package:verbaquiz/domain/repositories/quiz_repository.dart';

class QuizMockDataSource {
  static String getQuiz = 'assets/test/mock_repositories/quiz/get_quiz.json';
}

@Injectable(as: QuizRepository)
class MockQuizRepository implements QuizRepository {
  MockQuizRepository();

  @override
  Future<Quiz> getQuiz() async {
    final String response = await rootBundle.loadString(
      QuizMockDataSource.getQuiz,
      cache: false,
    );

    Map<String, dynamic> quiz = jsonDecode(response);

    return Quiz.fromMap(quiz);
  }
}
