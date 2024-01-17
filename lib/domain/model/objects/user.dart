import 'package:equatable/equatable.dart';
import 'package:verbaquiz/domain/exceptions/malformed_map_exception.dart';

// TODO: Implement intl and transforms

class User extends Equatable {
  final int id;
  final String name;
  final DateTime dateCreated;
  final DateTime dateUpdated;

  const User({
    required this.id,
    required this.name,
    required this.dateCreated,
    required this.dateUpdated,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    dateCreated,
    dateUpdated,
  ];

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
//        'date_created': DateFormat('HH:mm:ss dd MMMM y').format(dateCreated),
//        'date_updated': dateFinished != null ? DateFormat('HH:mm:ss dd MMMM y').format(dateFinished) : null,
  };

  factory User.fromMap(Map<String, dynamic> map) {
    if (map['id'] is! int
        || map['name'] is! String
        || map['date_created'] is! String
        || map['date_updated'] is! String
    ) {
      throw MalformedUserMapException(map);
    }

    return User(
      id: map['id'],
      name: map['name'],
      dateCreated: map['date_created'],
      dateUpdated: map['date_updated'],
    );
  }
}

class MalformedUserMapException implements MalformedMapException {
  @override
  final Map<String, dynamic> map;

  MalformedUserMapException(this.map);
}