import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:verbaquiz/domain/exceptions/questions_not_found_exception.dart';
import 'package:verbaquiz/domain/model/objects/answer.dart';
import 'package:verbaquiz/domain/model/objects/question.dart';
import 'package:verbaquiz/domain/model/value_object/response.dart';
import 'package:verbaquiz/domain/repositories/question_api_repository.dart';
import 'package:verbaquiz/domain/services/http_service.dart';

@Injectable(as: QuestionApiRepository)
class HttpQuestionRepository implements QuestionApiRepository {
  final HttpService _httpService;

  HttpQuestionRepository(
    this._httpService,
  );

  static const String urlApiAllQuestions = 'https://verbaquizandmortyapi.com/api/question';
  static const String urlApiAllQuestionsByGender = 'https://verbaquizandmortyapi.com/api/question/?gender=';
  static const String urlApiAllQuestionsByName = 'https://verbaquizandmortyapi.com/api/question/?name=';

  // TODO: Make read for various page not only first page
  @override
  Future<List<Question>> readAll() async => await _readQuestionsFromApiUrl(urlApiAllQuestions);

  @override
  Future<List<Question>> readFemaleQuestions() async => await _readQuestionsFromApiUrl('${urlApiAllQuestionsByGender}female');

  @override
  Future<List<Question>> readGenderlessQuestions() async => await _readQuestionsFromApiUrl('${urlApiAllQuestionsByGender}genderless');

  @override
  Future<List<Question>> readQuestionsByName(String name) async => await _readQuestionsFromApiUrl('$urlApiAllQuestionsByName$name');

  @override
  Future<List<Question>> readMaleQuestions() async => await _readQuestionsFromApiUrl('${urlApiAllQuestionsByGender}male');

  @override
  Future<List<Question>> readUnknownQuestions() async => await _readQuestionsFromApiUrl('${urlApiAllQuestionsByGender}unknown');

  Future<List<Question>> _readQuestionsFromApiUrl(String url) async {
    final List<Question> questions = [];
    List<Answer> answers = [];

    final Response response = await _httpService.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> questionsApiResponse = jsonDecode(response.body)['results'];

      for (var question in questionsApiResponse) {
        answers = [];
        for (var answer in question['answer']) {
          final Response answersResponse = await _httpService.get(Uri.parse(answer));
          Map<String, dynamic> answersApiResponse = jsonDecode(answersResponse.body);

          if (answersResponse.statusCode == 200) {
            Map<String, dynamic> answerMap = {
              'id': answersApiResponse['id'],
              'text': answersApiResponse['text'],
            };
            answers.add(Answer.fromMap(answerMap));
          } else {
            throw const QuestionsNotFoundException();
          }
        }

        Map<String, dynamic> questionMap = {
          'id': question['id'],
          'text': question['text'],
          'answers': answers,
          'correctAnswer': answers.first,
        };
        questions.add(Question.fromMap(questionMap));
      }

      return questions;
    } else {
      throw const QuestionsNotFoundException();
    }
  }

  @override
  Future<List<int>> readFavoriteQuestionsIds() {
    // TODO: implement readFavoriteQuestionsIds
    throw UnimplementedError();
  }

  @override
  Future<List<Question>> removeFavoriteQuestions({required Question question}) {
    // TODO: implement removeFavoriteQuestions
    throw UnimplementedError();
  }

  @override
  Future<List<Question>> saveFavoriteQuestion({required Question question}) {
    // TODO: implement saveFavoriteQuestion
    throw UnimplementedError();
  }
}
