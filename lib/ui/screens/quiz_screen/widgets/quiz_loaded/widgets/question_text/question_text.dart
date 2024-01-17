part of '../../../../quiz_screen.dart';

class QuestionText extends StatelessWidget {

  final String questionText;

  const QuestionText({super.key, required this.questionText,});

  @override
  Widget build(BuildContext context) {
    return Text(questionText);
  }
}
