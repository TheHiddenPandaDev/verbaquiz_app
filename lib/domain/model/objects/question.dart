import 'package:equatable/equatable.dart';
import 'package:verbaquiz/domain/exceptions/malformed_map_exception.dart';

import 'package:verbaquiz/domain/model/objects/answer.dart';

class Question extends Equatable {
  final int id;
  final String text;
  final List<Answer> answers;
  final Answer correctAnswer;

  const Question({
    required this.id,
    required this.text,
    required this.answers,
    required this.correctAnswer,
  });

  @override
  List<Object?> get props => [
        id,
        text,
        answers,
        correctAnswer,
      ];

  Map<String, dynamic> toMap() => {
        'id': id,
        'text': text,
        'answers': answers,
        'correctAnswer': correctAnswer,
      };

  factory Question.fromMap(Map<String, dynamic> map) {
    if (map['id'] is! int || map['text'] is! String || map['answers'] is! List<Answer>) throw MalformedQuestionMapException(map);

    return Question(
      id: map['id'],
      text: map['text'],
      answers: map['answers'],
      correctAnswer: map['correctAnswer'],
    );
  }
}

class MalformedQuestionMapException implements MalformedMapException {
  @override
  final Map<String, dynamic> map;

  MalformedQuestionMapException(this.map);
}
