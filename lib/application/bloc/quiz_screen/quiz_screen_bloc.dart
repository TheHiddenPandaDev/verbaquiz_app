import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:verbaquiz/domain/model/objects/quiz.dart';
import 'package:verbaquiz/domain/services/ui/quiz_service.dart';

part 'quiz_screen_event.dart';
part 'quiz_screen_state.dart';

@lazySingleton
class QuizScreenBloc extends Bloc<QuizScreenEvent, QuizScreenState> {
  final QuizService _quizService;

  QuizScreenBloc(
    this._quizService,
  ) : super(const QuizScreenInitial()) {
    on<QuizScreenEventLoadQuiz>(_handleLoadQuiz);
  }

  void _handleLoadQuiz(
      QuizScreenEventLoadQuiz event,
    Emitter<QuizScreenState> emit,
  ) async {
    try {
      emit(QuizScreenQuizLoaded(quiz: await _quizService.getQuiz()));
    } on Exception catch (_, e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
