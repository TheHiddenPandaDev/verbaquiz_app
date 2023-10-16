import 'package:verbaquiz/domain/model/objects/answer.dart';
import 'package:verbaquiz/domain/model/objects/quiz.dart';

abstract class QuizRepository {
  Future<Quiz> getQuiz();
  Future<Quiz> saveUserAnswers(Map<int, Answer> userAnswers);
}
