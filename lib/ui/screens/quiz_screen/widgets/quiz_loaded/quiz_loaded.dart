part of '../../quiz_screen.dart';

class QuizLoaded extends StatelessWidget {
  final bool hasCountDown;

  final QuizScreenBloc _quizScreenBloc = GetIt.instance.get<QuizScreenBloc>();
  final QuestionBloc _questionBloc = GetIt.instance.get<QuestionBloc>();

  QuizLoaded({
    super.key,
    required this.hasCountDown,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionBloc, QuestionState>(
      bloc: _questionBloc,
      builder: (context, questionState) {
        if (questionState is QuestionLoaded) {
          return Column(
            children: [
              Center(
                child: CountDownTimer(
                  hasCountDown: hasCountDown,
                  countDownController: _quizScreenBloc.countDownController,
                  onComplete: () => _questionBloc.add(const LoadCorrectAnswer()),
                ),
              ),
              const SizedBox(height: 50),
              Center(
                child: QuestionsCounter(
                  currentNumQuestion: _quizScreenBloc.currentQuestion + 1,
                  numQuestions: _quizScreenBloc.quiz!.questions.length,
                ),
              ),
              const SizedBox(height: 50),
              Center(
                child: QuestionText(
                  questionText: questionState.question.text,
                ),
              ),
              const SizedBox(height: 50),
              QuestionAnswers(
                answers: questionState.question.answers,
                isCorrectQuestionLoaded: questionState is CorrectQuestionLoaded,
                correctAnswer: questionState.question.correctAnswer,
                answerSelected: (questionState is CorrectQuestionLoaded) ? questionState.answerSelected : null,
                onPressAnswer: (Answer answerSelected) {
                  _quizScreenBloc.countDownController.pause();
                  _questionBloc.add(
                    LoadCorrectAnswer(
                      answerSelected: answerSelected,
                    ),
                  );
                },
              ),
              const SizedBox(height: 50),
              NextQuestionBtn(
                isCorrectQuestionLoaded: questionState is CorrectQuestionLoaded,
                onPressed: () {
                  _quizScreenBloc.add(const QuizScreenEventLoadNextQuestion());
                  _quizScreenBloc.countDownController.reset();
                  _quizScreenBloc.countDownController.start();
                },
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
