part of 'question_bloc.dart';

abstract class QuestionScreenEvent extends Equatable {
  const QuestionScreenEvent();

  @override
  List<Object?> get props => [];
}

class LoadQuestion extends QuestionScreenEvent {
  final Question question;

  const LoadQuestion({
    required this.question,
  });

  @override
  List<Object?> get props => [
        question,
      ];
}

class LoadCorrectAnswer extends QuestionScreenEvent {
  final Answer answerSelected;
  const LoadCorrectAnswer({
    required this.answerSelected,
  });
}
