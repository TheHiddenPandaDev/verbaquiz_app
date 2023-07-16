import 'package:bloc_test/bloc_test.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:verbaquiz/application/bloc/main_screen/main_screen_bloc.dart';
import 'package:verbaquiz/domain/model/objects/answer.dart';
import 'package:verbaquiz/domain/model/objects/question.dart';
import 'package:verbaquiz/domain/services/ui/question_service.dart';

import 'main_screen_bloc_test.mocks.dart';

@GenerateMocks([
  QuestionService,
])
void main() {
  final Faker faker = Faker();

  final QuestionService questionService = MockQuestionService();

  group('Main Screen Bloc', () {
    // TODO: Generate MockGenerator Question

    final int id = faker.randomGenerator.integer(5);
    final String text = faker.lorem.words(1).join('');
    final List<Answer> answers = [];
    final Answer correctAnswer = Answer(
      id: id,
      text: text,
    );

    final List<Question> questions = [
      Question(
        id: id,
        text: text,
        answers: answers,
        correctAnswer: correctAnswer,
      ),
    ];

    when(questionService.readAll()).thenAnswer((_) => Future.value(questions));
    when(questionService.readFemaleQuestions()).thenAnswer((_) => Future.value(questions));

    blocTest(
      'Creating Bloc',
      build: () => MainScreenBloc(
        questionService,
      ),
      expect: () => [
        MainScreenQuestionsLoaded(questions: questions),
      ],
      verify: (_) {
        verify(questionService.readAll()).called(1);
      },
    );

    blocTest(
      'Send Female Questions',
      build: () => MainScreenBloc(
        questionService,
      )..add(const MainScreenEventLoadFemaleGenderQuestions()),
      expect: () => [
        MainScreenQuestionsLoaded(questions: questions),
        const MainScreenLoadingQuestions(),
        MainScreenQuestionsLoaded(questions: questions),
      ],
      verify: (_) {
        verify(questionService.readAll()).called(1);
        verify(questionService.readFemaleQuestions()).called(1);
      },
    );
  });
}
