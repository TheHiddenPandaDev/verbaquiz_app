part of 'quiz_screen_bloc.dart';

abstract class QuizScreenEvent extends Equatable {
  const QuizScreenEvent();

  @override
  List<Object?> get props => [];
}

class QuizScreenEventLoadQuiz extends QuizScreenEvent {
  const QuizScreenEventLoadQuiz();
}

class QuizScreenEventLoadNextQuestion extends QuizScreenEvent {
  final Answer? userAnswer;

  const QuizScreenEventLoadNextQuestion({
    this.userAnswer,
  });

  @override
  List<Object?> get props => [
        userAnswer,
      ];
}

class QuizScreenEventResetQuiz extends QuizScreenEvent {
  const QuizScreenEventResetQuiz();
}
