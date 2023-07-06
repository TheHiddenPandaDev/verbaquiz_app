import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:verbaquiz/domain/model/objects/question.dart';
import 'package:verbaquiz/domain/services/question_service.dart';

part 'main_screen_event.dart';
part 'main_screen_state.dart';

@lazySingleton
class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  final QuestionService _questionService;

  MainScreenBloc(
    this._questionService,
  ) : super(const MainScreenInitial()) {
    on<MainScreenEventLoadAllQuestions>(_handleLoadAllQuestions);
    on<MainScreenEventLoadUnknownGenderQuestions>(_handleLoadUnknownGenderQuestions);
    on<MainScreenEventLoadFemaleGenderQuestions>(_handleLoadFemaleGenderQuestions);
    on<MainScreenEventLoadMaleGenderQuestions>(_handleLoadMaleGenderQuestions);
    on<MainScreenEventLoadGenderlessQuestions>(_handleLoadGenderlessQuestions);
    on<MainScreenEventLoadQuestionsBySearch>(_handleLoadQuestionsBySearch);
    on<MainScreenEventLoadFavoritesQuestions>(_handleLoadFavoritesQuestions);
    on<MainScreenEventSaveQuestionAsFavorite>(_handleSaveQuestionAsFavorite);
    on<MainScreenEventRemoveQuestionAsFavorite>(_handleRemoveQuestionAsFavorite);

    add(const MainScreenEventLoadAllQuestions());
  }

  void _handleLoadAllQuestions(
    MainScreenEventLoadAllQuestions event,
    Emitter<MainScreenState> emit,
  ) async {
    try {
      emit(MainScreenQuestionsLoaded(questions: await _questionService.readAll()));
    } on Exception catch (_, e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void _handleLoadUnknownGenderQuestions(
    MainScreenEventLoadUnknownGenderQuestions event,
    Emitter<MainScreenState> emit,
  ) async {
    emit(const MainScreenLoadingQuestions());
    try {
      emit(MainScreenQuestionsLoaded(questions: await _questionService.readUnknownQuestions()));
    } on Exception catch (_, e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void _handleLoadFemaleGenderQuestions(
    MainScreenEventLoadFemaleGenderQuestions event,
    Emitter<MainScreenState> emit,
  ) async {
    emit(const MainScreenLoadingQuestions());
    try {
      emit(MainScreenQuestionsLoaded(questions: await _questionService.readFemaleQuestions()));
    } on Exception catch (_, e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void _handleLoadMaleGenderQuestions(
    MainScreenEventLoadMaleGenderQuestions event,
    Emitter<MainScreenState> emit,
  ) async {
    emit(const MainScreenLoadingQuestions());
    try {
      emit(MainScreenQuestionsLoaded(questions: await _questionService.readMaleQuestions()));
    } on Exception catch (_, e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void _handleLoadGenderlessQuestions(
    MainScreenEventLoadGenderlessQuestions event,
    Emitter<MainScreenState> emit,
  ) async {
    emit(const MainScreenLoadingQuestions());
    try {
      emit(MainScreenQuestionsLoaded(questions: await _questionService.readGenderlessQuestions()));
    } on Exception catch (_, e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void _handleLoadQuestionsBySearch(
    MainScreenEventLoadQuestionsBySearch event,
    Emitter<MainScreenState> emit,
  ) async {
    emit(const MainScreenLoadingQuestions());
    try {
      emit(MainScreenQuestionsLoaded(questions: await _questionService.searchQuestions(name: event.name)));
    } on Exception catch (_, e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void _handleLoadFavoritesQuestions(
    MainScreenEventLoadFavoritesQuestions event,
    Emitter<MainScreenState> emit,
  ) async {
    emit(const MainScreenLoadingQuestions());
    try {
      emit(MainScreenQuestionsLoaded(questions: await _questionService.readAll()));
    } on Exception catch (_, e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void _handleSaveQuestionAsFavorite(
    MainScreenEventSaveQuestionAsFavorite event,
    Emitter<MainScreenState> emit,
  ) async {
    emit(const MainScreenLoadingQuestions());
    try {
      emit(MainScreenQuestionsLoaded(questions: await _questionService.readAll()));
    } on Exception catch (_, e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void _handleRemoveQuestionAsFavorite(
    MainScreenEventRemoveQuestionAsFavorite event,
    Emitter<MainScreenState> emit,
  ) async {
    emit(const MainScreenLoadingQuestions());
    try {
      emit(MainScreenQuestionsLoaded(questions: await _questionService.readAll()));
    } on Exception catch (_, e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
