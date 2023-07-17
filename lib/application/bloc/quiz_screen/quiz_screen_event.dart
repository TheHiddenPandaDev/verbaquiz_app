part of 'quiz_screen_bloc.dart';

abstract class QuizScreenEvent extends Equatable {
  const QuizScreenEvent();

  @override
  List<Object?> get props => [];
}

class QuizScreenEventLoadQuiz extends QuizScreenEvent {
  const QuizScreenEventLoadQuiz();
}