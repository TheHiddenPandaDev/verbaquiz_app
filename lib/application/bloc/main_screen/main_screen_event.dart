part of 'main_screen_bloc.dart';

abstract class MainScreenEvent extends Equatable {
  const MainScreenEvent();
}

// Events to Load information

class MainScreenEventLoad extends MainScreenEvent {
  const MainScreenEventLoad();

  @override
  List<Object?> get props => [];
}

class MainScreenEventLoadAllQuestions extends MainScreenEventLoad {
  const MainScreenEventLoadAllQuestions();
}

class MainScreenEventLoadUnknownGenderQuestions extends MainScreenEventLoad {
  const MainScreenEventLoadUnknownGenderQuestions();
}

class MainScreenEventLoadFemaleGenderQuestions extends MainScreenEventLoad {
  const MainScreenEventLoadFemaleGenderQuestions();
}

class MainScreenEventLoadMaleGenderQuestions extends MainScreenEventLoad {
  const MainScreenEventLoadMaleGenderQuestions();
}

class MainScreenEventLoadGenderlessQuestions extends MainScreenEventLoad {
  const MainScreenEventLoadGenderlessQuestions();
}

class MainScreenEventLoadQuestionsBySearch extends MainScreenEventLoad {
  final String name;

  const MainScreenEventLoadQuestionsBySearch({
    required this.name,
  });

  @override
  List<Object?> get props => [name];
}

class MainScreenEventLoadFavoritesQuestions extends MainScreenEventLoad {
  const MainScreenEventLoadFavoritesQuestions();
}

// Events to Save or Remove question as Favorite

class MainScreenEventFavorite extends MainScreenEvent {
  final Question question;

  const MainScreenEventFavorite({
    required this.question,
  });

  @override
  List<Object?> get props => [question];
}

class MainScreenEventSaveQuestionAsFavorite extends MainScreenEventFavorite {
  const MainScreenEventSaveQuestionAsFavorite({
    required Question question,
  }) : super(question: question);
}

class MainScreenEventRemoveQuestionAsFavorite extends MainScreenEventFavorite {
  const MainScreenEventRemoveQuestionAsFavorite({
    required Question question,
  }) : super(question: question);
}
