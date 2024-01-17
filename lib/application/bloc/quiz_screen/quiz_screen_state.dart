part of 'quiz_screen_bloc.dart';

@immutable
abstract class QuizScreenState extends Equatable {
  const QuizScreenState();
}

class QuizScreenInitial extends QuizScreenState {
  const QuizScreenInitial();

  @override
  List<Object> get props => [];
}

class QuizScreenStarted extends QuizScreenState {
  const QuizScreenStarted();

  @override
  List<Object> get props => [];
}

class QuizScreenQuizLoading extends QuizScreenStarted {
  const QuizScreenQuizLoading();
}

class QuizScreenQuizLoaded extends QuizScreenStarted {
  const QuizScreenQuizLoaded();
}

class QuizScreenQuizFinished extends QuizScreenStarted   {
  final Quiz quiz;
  const QuizScreenQuizFinished(this.quiz);
}
