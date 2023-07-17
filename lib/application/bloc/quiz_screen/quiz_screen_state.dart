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

class QuizScreenQuizLoading extends QuizScreenInitial {
  const QuizScreenQuizLoading();
}

class QuizScreenQuizLoaded extends QuizScreenState {
  final Quiz quiz;

  const QuizScreenQuizLoaded({
    required this.quiz,
  });

  @override
  List<Object> get props => [quiz];
}
