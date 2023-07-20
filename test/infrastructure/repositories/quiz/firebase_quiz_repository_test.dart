import 'package:flutter_test/flutter_test.dart';
import 'package:verbaquiz/domain/model/objects/quiz.dart';
import 'package:verbaquiz/infrastructure/repositories/quiz/firebase_quiz_repository.dart';

void main() {
  group('Tests over Quiz Repository', () {
    final HttpQuizRepository repository = HttpQuizRepository();

    test('Connection OK - Super Hero OK - Reading Quiz', () async {

      expect(await repository.getQuiz(), isA<Quiz>());
    });

    // TODO: Make tests in case of connection fail (expect throw exception)

    // TODO: Make tests in case of malformed (expect throw exception)

    // TODO: Make tests calling other endpoints
  });
}
