import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:verbaquiz/domain/model/objects/question.dart';
import 'package:verbaquiz/domain/model/value_object/response.dart';
import 'package:verbaquiz/domain/services/http_service.dart';
import 'package:verbaquiz/infrastructure/repositories/question/http_question_repository.dart';

import 'http_question_repository_test.mocks.dart';

@GenerateMocks([HttpService])
void main() {
  group('Tests over Question Repository', () {
    final Faker faker = Faker();
    final HttpService httpService = MockHttpService();
    final HttpQuestionRepository repository = HttpQuestionRepository(httpService);

    // TODO: Generate mock generator

    final int id = faker.randomGenerator.integer(5);
    final String text = faker.lorem.words(1).join('');
    final String url = faker.lorem.words(2).join('');

    final String httpMockQuestionsResponseOK = '''
    {
      "results": [{
        "id": $id,
        "text": "$text",
        "answer":  [
          "$url"
        ]
      }]
    }''';

    final int idAnswer = faker.randomGenerator.integer(5);
    final String textAnswer = faker.lorem.words(2).join('');

    final String httpMockAnswerResponseOK = '''
    {
      "id": $idAnswer,
      "text": "$textAnswer"
    }
    ''';

    test('Connection OK - Super Hero OK - Reading All Questions', () async {
      when(httpService.get(Uri.parse(HttpQuestionRepository.urlApiAllQuestions))).thenAnswer(
        (_) => Future.value(
          Response(
            body: httpMockQuestionsResponseOK,
            statusCode: 200,
            headers: const {'header': 'mock'},
          ),
        ),
      );

      when(httpService.get(Uri.parse(url))).thenAnswer(
        (_) => Future.value(
          Response(
            body: httpMockAnswerResponseOK,
            statusCode: 200,
            headers: const {'header': 'mock'},
          ),
        ),
      );

      expect(await repository.readAll(), isA<List<Question>>());
    });

    // TODO: Make tests in case of connection fail (expect throw exception)

    // TODO: Make tests in case of malformed (expect throw exception)

    // TODO: Make tests calling other endpoints
  });
}
