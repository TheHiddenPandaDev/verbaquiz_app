// import 'package:intl/intl.dart';

import 'package:equatable/equatable.dart';
import 'package:verbaquiz/domain/exceptions/malformed_map_exception.dart';

import 'package:verbaquiz/domain/model/objects/question.dart';

// TODO: Implement intl and transforms

class Quiz extends Equatable {
  final int id;
  final List<Question> questions;
  final int userId;
  final bool isFinished;
  final DateTime dateCreated;
  final DateTime? dateFinished;

  const Quiz({
    required this.id,
    required this.questions,
    required this.userId,
    required this.isFinished,
    required this.dateCreated,
    this.dateFinished,
  });

  @override
  List<Object?> get props => [
        id,
        questions,
        userId,
        isFinished,
        dateCreated,
        dateFinished,
      ];

  Map<String, dynamic> toMap() => {
        'id': id,
        'questions': questions,
        'user_id': userId,
//        'date_created': DateFormat('HH:mm:ss dd MMMM y').format(dateCreated),
//        'is_finished': dateFinished != null ? DateFormat('HH:mm:ss dd MMMM y').format(dateFinished) : null,
      };

  factory Quiz.fromMap(Map<String, dynamic> map) {
    if (map['id'] is! int
        || map['questions'] is! List
        || map['is_finished'] is! bool
        || map['user_id'] is! int
        || map['date_created'] is! String
    ) {
      throw MalformedQuizMapException(map);
    }

    List<Question> questions = [];

    for (Map<String, dynamic> question in map['questions']) {
      questions.add(Question.fromMap(question));
    }

    return Quiz(
      id: map['id'],
      questions: questions,
      isFinished: map['is_finished'],
      userId: map['user_id'],
      dateCreated: map['date_created'],
      dateFinished: map['date_finished'],
    );
  }
}

class MalformedQuizMapException implements MalformedMapException {
  @override
  final Map<String, dynamic> map;

  MalformedQuizMapException(this.map);
}
