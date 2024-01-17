import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:verbaquiz/domain/model/objects/answer.dart';
import 'package:verbaquiz/domain/model/objects/question.dart';

part 'question_event.dart';
part 'question_state.dart';

@lazySingleton
class QuestionBloc extends Bloc<QuestionScreenEvent, QuestionState> {
  Question? question;

  QuestionBloc() : super(const QuestionScreenInitial()) {
    on<LoadQuestion>(_handleLoadQuestion);
    on<LoadCorrectAnswer>(_handleLoadCorrectAnswer);
  }

  Future<void> _handleLoadQuestion(
    LoadQuestion event,
    Emitter<QuestionState> emit,
  ) async {
    question = event.question;
    emit(QuestionLoaded(question: question!));
  }

  void _handleLoadCorrectAnswer(
    LoadCorrectAnswer event,
    Emitter<QuestionState> emit,
  ) {
    emit(const QuestionLoading());

    if (question == null) {
      debugPrint("No question set up");
      return;
    }

    if(event.answerSelected != null) {
      question = Question(
        id: question!.id,
        text: question!.text,
        answers: question!.answers,
        correctAnswer: question!.correctAnswer,
        userAnswer: event.answerSelected,
      );
    }

    emit(CorrectQuestionLoaded(
      question: question!,
      correctAnswer: question!.correctAnswer,
      answerSelected: event.answerSelected,
    ));
  }
}
