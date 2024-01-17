import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:verbaquiz/application/bloc/question/question_bloc.dart';
import 'package:verbaquiz/domain/model/objects/answer.dart';
import 'package:verbaquiz/domain/model/objects/quiz.dart';
import 'package:verbaquiz/domain/services/ui/quiz_service.dart';

part 'quiz_screen_event.dart';
part 'quiz_screen_state.dart';

@lazySingleton
class QuizScreenBloc extends Bloc<QuizScreenEvent, QuizScreenState> {
  final QuizService _quizService;
  final QuestionBloc _questionBloc;
  final CountDownController countDownController = CountDownController();

  Quiz? quiz;
  int currentQuestion = -1;
  Map<int, Answer> userAnswers = {};

  QuizScreenBloc(
    this._quizService,
    this._questionBloc,
  ) : super(const QuizScreenInitial()) {
    on<QuizScreenEventLoadQuiz>(_handleLoadQuiz);
    on<QuizScreenEventLoadNextQuestion>(_handleGetNextQuestion);
    on<QuizScreenEventResetQuiz>(_handleGetResetQuiz);
  }

  void _handleGetResetQuiz(
    QuizScreenEventResetQuiz event,
    Emitter<QuizScreenState> emit,
  ) {
    quiz = null;
    currentQuestion = -1;
    userAnswers = {};
    _questionBloc.question = null;
    emit(const QuizScreenInitial());
  }

  Future<void> _handleLoadQuiz(
    QuizScreenEventLoadQuiz event,
    Emitter<QuizScreenState> emit,
  ) async {
    try {
      quiz = await _quizService.getQuiz();
      add(const QuizScreenEventLoadNextQuestion());
    } on Exception catch (_, e) {
      debugPrint(e.toString());
    }
  }

  Future<void> _handleGetNextQuestion(
    QuizScreenEventLoadNextQuestion event,
    Emitter<QuizScreenState> emit,
  ) async {
    emit(const QuizScreenQuizLoading());

    if (quiz == null) {
      debugPrint("Quiz didn't start yet");
      return;
    }

    if(_questionBloc.question != null && _questionBloc.question!.userAnswer != null) {
      userAnswers.addAll({_questionBloc.question!.userAnswer!.id: _questionBloc.question!.userAnswer!});
    }

    if (currentQuestion + 1 < quiz!.questions.length) {

      currentQuestion++;
      _questionBloc.add(LoadQuestion(question: quiz!.questions[currentQuestion]));
      emit(const QuizScreenQuizLoaded());
      return;
    }


    // TODO: Send userAnswers
    quiz = await _quizService.saveUserAnswers(userAnswers);

    emit(QuizScreenQuizFinished(quiz!));
  }
}
