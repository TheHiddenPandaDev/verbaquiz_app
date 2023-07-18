part of 'question_bloc.dart';

@immutable
abstract class QuestionState extends Equatable {
  const QuestionState();
}

class QuestionScreenInitial extends QuestionState {
  const QuestionScreenInitial();

  @override
  List<Object> get props => [];
}

class QuestionLoading extends QuestionState {
  const QuestionLoading();

  @override
  List<Object> get props => [];
}

class QuestionLoaded extends QuestionState {
  final Question question;

  const QuestionLoaded({
    required this.question,
  });

  @override
  List<Object> get props => [
        question,
      ];
}

class CorrectQuestionLoaded extends QuestionLoaded {
  final Answer correctAnswer;
  final Answer answerSelected;

  const CorrectQuestionLoaded({
    required super.question,
    required this.correctAnswer,
    required this.answerSelected,
  });

  @override
  List<Object> get props => [
        question,
        correctAnswer,
        answerSelected,
      ];
}
