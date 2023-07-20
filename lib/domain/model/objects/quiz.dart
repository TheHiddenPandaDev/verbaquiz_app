import 'package:equatable/equatable.dart';
import 'package:verbaquiz/domain/exceptions/malformed_map_exception.dart';

import 'package:verbaquiz/domain/model/objects/question.dart';

class Quiz extends Equatable {
  final int id;
  final List<Question> questions;

  const Quiz({
    required this.id,
    required this.questions,
  });

  @override
  List<Object?> get props => [
        id,
        questions,
      ];

  Map<String, dynamic> toMap() => {
        'id': id,
        'questions': questions,
      };

  factory Quiz.fromMap(Map<String, dynamic> map) {
    if (map['id'] is! int || map['questions'] is! List) {
      throw MalformedQuizMapException(map);
    }

    List<Question> questions = [];

    for (Map<String, dynamic> question in map['questions']){
      questions.add(Question.fromMap(question));
    }

    return Quiz(
      id: map['id'],
      questions: questions,
    );
  }
}

class MalformedQuizMapException implements MalformedMapException {
  @override
  final Map<String, dynamic> map;

  MalformedQuizMapException(this.map);
}
