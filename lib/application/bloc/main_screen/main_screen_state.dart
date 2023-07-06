part of 'main_screen_bloc.dart';

@immutable
abstract class MainScreenState extends Equatable {
  const MainScreenState();
}

class MainScreenInitial extends MainScreenState {
  const MainScreenInitial();

  @override
  List<Object> get props => [];
}

class MainScreenLoadingQuestions extends MainScreenInitial {
  const MainScreenLoadingQuestions();
}

class MainScreenQuestionsLoaded extends MainScreenState {
  final List<Question> questions;

  const MainScreenQuestionsLoaded({
    required this.questions,
  });

  @override
  List<Object> get props => [questions];
}
