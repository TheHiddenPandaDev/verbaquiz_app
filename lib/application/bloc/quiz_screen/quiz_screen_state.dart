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

class QuizScreenQuizLoading extends QuizScreenState {
  const QuizScreenQuizLoading();

  @override
  List<Object> get props => [];
}

class QuizScreenQuizLoaded extends QuizScreenState {
  const QuizScreenQuizLoaded();

  @override
  List<Object> get props => [];
}
