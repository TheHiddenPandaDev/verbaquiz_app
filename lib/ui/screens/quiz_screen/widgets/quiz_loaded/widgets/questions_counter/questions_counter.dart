part of '../../../../quiz_screen.dart';

class QuestionsCounter extends StatelessWidget {

  final int currentNumQuestion;
  final int numQuestions;

  const QuestionsCounter({
    super.key,
    required this.currentNumQuestion,
    required this.numQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return Text('$currentNumQuestion / $numQuestions');
  }
}
