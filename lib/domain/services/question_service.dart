import 'package:injectable/injectable.dart';
import 'package:verbaquiz/domain/model/objects/question.dart';
import 'package:verbaquiz/domain/repositories/question_api_repository.dart';

@injectable
class QuestionService {
  final QuestionApiRepository _questionApiRepository;

  const QuestionService(
    this._questionApiRepository,
  );

  Future<List<Question>> readAll() async {
    try {
      return await _questionApiRepository.readAll();
    } catch (_) {
      rethrow;
    }
  }

  Future<List<Question>> readFemaleQuestions() async {
    try {
      return await _questionApiRepository.readFemaleQuestions();
    } catch (_) {
      rethrow;
    }
  }

  Future<List<Question>> readGenderlessQuestions() async {
    try {
      return await _questionApiRepository.readGenderlessQuestions();
    } catch (_) {
      rethrow;
    }
  }

  Future<List<Question>> searchQuestions({
    required String name,
  }) async {
    try {
      return await _questionApiRepository.readQuestionsByName(name);
    } catch (_) {
      rethrow;
    }
  }

  Future<List<Question>> readMaleQuestions() async {
    try {
      return await _questionApiRepository.readMaleQuestions();
    } catch (_) {
      rethrow;
    }
  }

  Future<List<Question>> readUnknownQuestions() async {
    try {
      return await _questionApiRepository.readUnknownQuestions();
    } catch (_) {
      rethrow;
    }
  }
}
