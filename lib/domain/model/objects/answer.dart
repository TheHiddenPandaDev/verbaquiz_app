import 'package:equatable/equatable.dart';
import 'package:verbaquiz/domain/exceptions/malformed_map_exception.dart';

class Answer extends Equatable {
  final int id;
  final String text;

  const Answer({
    required this.id,
    required this.text,
  });

  @override
  List<Object?> get props => [
        id,
        text,
      ];

  Map<String, dynamic> toMap() => {
        'id': id,
        'text': text,
      };

  factory Answer.fromMap(Map<String, dynamic> map) {
    if (map['id'] is! int || map['text'] is! String) throw MalformedAnswerMapException(map);

    return Answer(
      id: map['id'],
      text: map['text'],
    );
  }
}

class MalformedAnswerMapException implements MalformedMapException {
  @override
  final Map<String, dynamic> map;

  MalformedAnswerMapException(this.map);
}
