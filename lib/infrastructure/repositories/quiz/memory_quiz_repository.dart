import 'package:injectable/injectable.dart';
import 'package:verbaquiz/domain/model/objects/answer.dart';
import 'package:verbaquiz/domain/model/objects/question.dart';
import 'package:verbaquiz/domain/model/objects/quiz.dart';
import 'package:verbaquiz/domain/repositories/quiz_repository.dart';

@Injectable(as: QuizRepository)
class MemoryQuizRepository implements QuizRepository {

  final Quiz quiz = Quiz(
    id: 1,
    userId: 1,
    isFinished: false,
    dateCreated: DateTime.now(),
    questions: const [
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
        id: 2,
        text: 'Pregunta 2',
        answers: [
          Answer(
            id: 5,
            text: 'Respuesta A',
          ),
          Answer(
            id: 6,
            text: 'Respuesta B',
          ),
          Answer(
            id: 7,
            text: 'Respuesta C',
          ),
          Answer(
            id: 8,
            text: 'Respuesta D',
          ),
        ],
        correctAnswer: Answer(
          id: 5,
          text: 'Respuesta A',
        ),
      ),
      Question(
        id: 3,
        text: 'Pregunta 3',
        answers: [
          Answer(
            id: 9,
            text: 'Respuesta A',
          ),
          Answer(
            id: 10,
            text: 'Respuesta B',
          ),
          Answer(
            id: 11,
            text: 'Respuesta C',
          ),
          Answer(
            id: 12,
            text: 'Respuesta D',
          ),
        ],
        correctAnswer: Answer(
          id: 9,
          text: 'Respuesta A',
        ),
      ),
      Question(
        id: 4,
        text: 'Pregunta 4',
        answers: [
          Answer(
            id: 13,
            text: 'Respuesta A',
          ),
          Answer(
            id: 14,
            text: 'Respuesta B',
          ),
          Answer(
            id: 15,
            text: 'Respuesta C',
          ),
          Answer(
            id: 16,
            text: 'Respuesta D',
          ),
        ],
        correctAnswer: Answer(
          id: 13,
          text: 'Respuesta A',
        ),
      ),
    ],
  );

  MemoryQuizRepository();

  @override
  Future<Quiz> getQuiz() {
    return Future.value(quiz);
  }

  @override
  Future<Quiz> saveUserAnswers(Map<int, Answer> userAnswers) {

    // Firebase send Quiz
    return Future.value(quiz);
  }
}
