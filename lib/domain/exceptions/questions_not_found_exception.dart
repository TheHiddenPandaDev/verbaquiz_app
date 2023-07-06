import 'package:verbaquiz/domain/exceptions/repository_error_exception.dart';

class QuestionsNotFoundException implements RepositoryErrorException {
  const QuestionsNotFoundException();
}
