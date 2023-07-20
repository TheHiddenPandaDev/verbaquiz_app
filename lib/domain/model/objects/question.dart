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
    if (map['id'] is! int ||
        map['text'] is! String ||
        map['answers'] is! List ||
        map['correct_answer'] is! Map<String, dynamic>) {
      throw MalformedQuestionMapException(map);
    }

    List<Answer> answers = [];

    for (Map<String, dynamic> answer in map['answers']){
      answers.add(Answer.fromMap(answer));
    }

    return Question(
      id: map['id'],
      text: map['text'],
      answers: answers,
      correctAnswer: Answer.fromMap(map['correct_answer']),
    );
  }
}

class MalformedQuestionMapException implements MalformedMapException {
  @override
  final Map<String, dynamic> map;

  MalformedQuestionMapException(this.map);
}
