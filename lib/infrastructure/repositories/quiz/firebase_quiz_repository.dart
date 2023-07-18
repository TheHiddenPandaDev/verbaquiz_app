import 'package:verbaquiz/domain/model/objects/answer.dart';
import 'package:verbaquiz/domain/model/objects/question.dart';
import 'package:verbaquiz/domain/model/objects/quiz.dart';
import 'package:verbaquiz/domain/repositories/quiz_repository.dart';

class HttpQuizRepository implements QuizRepository {
  HttpQuizRepository();

  @override
  Future<Quiz> getQuiz() {
    return Future.value(
      const Quiz(
        id: 1,
        questions: [
          Question(
            id: 1,
            text: 'Pregunta 1',
            answers: [
              Answer(
                id: 1,
                text: 'Respuesta A',
              ),
              Answer(
                id: 2,
                text: 'Respuesta B',
              ),
              Answer(
                id: 3,
                text: 'Respuesta C',
              ),
              Answer(
                id: 4,
                text: 'Respuesta D',
              ),
            ],
            correctAnswer: Answer(
              id: 1,
              text: 'Respuesta A',
            ),
          ),
          Question(
            id: 1,
            text: 'Pregunta 2',
            answers: [
              Answer(
                id: 1,
                text: 'Respuesta A',
              ),
              Answer(
                id: 2,
                text: 'Respuesta B',
              ),
              Answer(
                id: 3,
                text: 'Respuesta C',
              ),
              Answer(
                id: 4,
                text: 'Respuesta D',
              ),
            ],
            correctAnswer: Answer(
              id: 1,
              text: 'Respuesta A',
            ),
          ),
          Question(
            id: 1,
            text: 'Pregunta 3',
            answers: [
              Answer(
                id: 1,
                text: 'Respuesta A',
              ),
              Answer(
                id: 2,
                text: 'Respuesta B',
              ),
              Answer(
                id: 3,
                text: 'Respuesta C',
              ),
              Answer(
                id: 4,
                text: 'Respuesta D',
              ),
            ],
            correctAnswer: Answer(
              id: 1,
              text: 'Respuesta A',
            ),
          ),
          Question(
            id: 1,
            text: 'Pregunta 4',
            answers: [
              Answer(
                id: 1,
                text: 'Respuesta A',
              ),
              Answer(
                id: 2,
                text: 'Respuesta B',
              ),
              Answer(
                id: 3,
                text: 'Respuesta C',
              ),
              Answer(
                id: 4,
                text: 'Respuesta D',
              ),
            ],
            correctAnswer: Answer(
              id: 1,
              text: 'Respuesta A',
            ),
          ),
        ],
      ),
    );
  }
}
