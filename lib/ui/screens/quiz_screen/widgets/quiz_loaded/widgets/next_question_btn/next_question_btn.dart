part of '../../../../quiz_screen.dart';

class NextQuestionBtn extends StatelessWidget {
  final bool isCorrectQuestionLoaded;
  final Function() onPressed;

  const NextQuestionBtn({
    super.key,
    required this.isCorrectQuestionLoaded,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return isCorrectQuestionLoaded ? TextButton(
      onPressed: () => onPressed.call(),
      child: const Text('Go Next'),
    ) : const SizedBox.shrink();
  }
}
