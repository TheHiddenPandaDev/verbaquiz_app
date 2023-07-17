import 'package:injectable/injectable.dart';
import 'package:verbaquiz/domain/model/objects/quiz.dart';
import 'package:verbaquiz/domain/repositories/quiz_repository.dart';

@Injectable(as: QuizRepository)
class HttpQuizRepository implements QuizRepository {

  HttpQuizRepository();

  @override
  Future<Quiz> getQuiz() {
    // TODO: implement getQuiz
    throw UnimplementedError();
  }
}
