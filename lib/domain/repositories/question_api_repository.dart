import 'package:verbaquiz/domain/model/objects/question.dart';

abstract class QuestionRepository {
  Future<List<Question>> readAll();
  Future<List<Question>> readFemaleQuestions();
  Future<List<Question>> readMaleQuestions();
  Future<List<Question>> readGenderlessQuestions();
  Future<List<Question>> readQuestionsByName(String name);
  Future<List<Question>> readUnknownQuestions();
  Future<List<int>> readFavoriteQuestionsIds();
  Future<List<Question>> saveFavoriteQuestion({
    required Question question,
  });
  Future<List<Question>> removeFavoriteQuestions({
    required Question question,
  });
}
