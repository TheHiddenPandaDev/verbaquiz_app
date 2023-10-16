part of '../../../../quiz_screen.dart';

class QuestionAnswers extends StatelessWidget {
  final bool isCorrectQuestionLoaded;
  final List<Answer> answers;
  final Answer correctAnswer;
  final Answer? answerSelected;
  final Function(Answer answerSelected) onPressAnswer;

  const QuestionAnswers({
    super.key,
    required this.answers,
    required this.isCorrectQuestionLoaded,
    required this.correctAnswer,
    required this.answerSelected,
    required this.onPressAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: answers.length,
      itemBuilder: (context, i) {
        if (isCorrectQuestionLoaded) {
          return Text(
            answers[i].text,
            style: TextStyle(
              color: (correctAnswer == answers[i])
                  ? Colors.green
                  : (answerSelected == answers[i])
                      ? Colors.red
                      : Colors.black,
            ),
          );
        } else {
          return TextButton(
            onPressed: () => onPressAnswer.call(answers[i]),
            child: Text(
              answers[i].text,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          );
        }
      },
    );
  }
}
