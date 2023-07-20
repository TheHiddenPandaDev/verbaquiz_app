import 'package:verbaquiz/domain/model/objects/quiz.dart';

abstract class QuizRepository {
  Future<Quiz> getQuiz();
}
