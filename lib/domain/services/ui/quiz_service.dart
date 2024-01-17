import 'package:injectable/injectable.dart';
import 'package:verbaquiz/domain/model/objects/answer.dart';
import 'package:verbaquiz/domain/model/objects/quiz.dart';
import 'package:verbaquiz/domain/repositories/quiz_repository.dart';

@injectable
class QuizService {
  final QuizRepository _quizRepository;

  const QuizService(
    this._quizRepository,
  );

  Future<Quiz> getQuiz() async {
    try {
      return await _quizRepository.getQuiz();
    } catch (_) {
      rethrow;
    }
  }

  Future<Quiz> saveUserAnswers(Map<int, Answer> answers) async {
    try {
      return await _quizRepository.saveUserAnswers(answers);
    } catch (_) {
      rethrow;
    }
  }
}
