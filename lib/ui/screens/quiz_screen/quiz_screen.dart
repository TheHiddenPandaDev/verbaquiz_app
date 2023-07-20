import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:verbaquiz/application/bloc/question/question_bloc.dart';
import 'package:verbaquiz/application/bloc/quiz_screen/quiz_screen_bloc.dart';

class QuizScreen extends StatefulWidget {
  static const String routeName = '/Quiz';

  const QuizScreen({
    super.key,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> with WidgetsBindingObserver {
  final QuizScreenBloc _quizScreenBloc = GetIt.instance.get<QuizScreenBloc>();
  final QuestionBloc _questionBloc = GetIt.instance.get<QuestionBloc>();

  final CountDownController _controller = CountDownController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
    if (WidgetsBinding.instance.lifecycleState != null) {
      switch (WidgetsBinding.instance.lifecycleState!) {
        case AppLifecycleState.inactive:
          debugPrint('inactive');
          break;
        case AppLifecycleState.paused:
          debugPrint('paused');
          break;
        case AppLifecycleState.detached:
          debugPrint('detached');
          break;
        case AppLifecycleState.resumed:
          debugPrint('resumed');
          break;
      }
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (WidgetsBinding.instance.lifecycleState != null) {
      switch (WidgetsBinding.instance.lifecycleState!) {
        case AppLifecycleState.inactive:
          debugPrint('inactive');
          break;
        case AppLifecycleState.paused:
          debugPrint('paused');
          break;
        case AppLifecycleState.detached:
          debugPrint('detached');
          break;
        case AppLifecycleState.resumed:
          debugPrint('resumed');
          break;
      }
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _quizScreenBloc.add(const QuizScreenEventResetQuiz());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final QuizScreenArguments? arguments = ModalRoute.of(context)?.settings.arguments as QuizScreenArguments?;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(false),
        ),
        title: const Text('Quiz'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<QuizScreenBloc, QuizScreenState>(
            bloc: _quizScreenBloc,
            builder: (context, quizScreenState) {
              if (quizScreenState is QuizScreenInitial) {
                _quizScreenBloc.add(const QuizScreenEventLoadQuiz());
                return const Center(
                  child: Text('Loading...'),
                );
              } else if (quizScreenState is QuizScreenQuizLoaded) {
                return BlocBuilder<QuestionBloc, QuestionState>(
                  bloc: _questionBloc,
                  builder: (context, questionState) {
                    if (questionState is QuestionLoaded) {
                      return Column(
                        children: [
                          Center(
                            child: arguments != null && arguments.hasCountdown
                                ? CircularCountDownTimer(
                                    duration: 10,
                                    initialDuration: 1,
                                    controller: _controller,
                                    width: 150,
                                    height: 150,
                                    ringColor: Colors.grey[300]!,
                                    ringGradient: null,
                                    fillColor: Colors.purpleAccent[100]!,
                                    fillGradient: null,
                                    backgroundColor: Colors.purple[500],
                                    backgroundGradient: null,
                                    strokeWidth: 10.0,
                                    strokeCap: StrokeCap.round,
                                    isReverse: false,
                                    isReverseAnimation: false,
                                    isTimerTextShown: true,
                                    autoStart: true,
                                    onStart: () {
                                      debugPrint('Countdown Started');
                                    },
                                    onComplete: () => _questionBloc.add(const LoadCorrectAnswer()),
                                    onChange: (String timeStamp) {
                                      debugPrint('Countdown Changed $timeStamp');
                                    },
                                    timeFormatterFunction: (defaultFormatterFunction, duration) {
                                      if (duration.inSeconds == 0) {
                                        return "Start";
                                      } else {
                                        return Function.apply(defaultFormatterFunction, [duration]);
                                      }
                                    },
                                  )
                                : const SizedBox.shrink(),
                          ),
                          const SizedBox(height: 50),
                          Center(
                            child: Text(
                                '${_quizScreenBloc.currentQuestion + 1} / ${_quizScreenBloc.quiz?.questions.length}'),
                          ),
                          const SizedBox(height: 50),
                          Center(
                            child: Text(questionState.question.text),
                          ),
                          const SizedBox(height: 50),
                          ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: questionState.question.answers.length,
                            itemBuilder: (context, i) {
                              if (questionState is CorrectQuestionLoaded) {
                                return Text(
                                  questionState.question.answers[i].text,
                                  style: TextStyle(
                                    color: (questionState.correctAnswer == questionState.question.answers[i])
                                        ? Colors.green
                                        : (questionState.answerSelected == questionState.question.answers[i])
                                            ? Colors.red
                                            : Colors.black,
                                  ),
                                );
                              } else {
                                return TextButton(
                                  onPressed: () {
                                    _controller.pause();
                                    _questionBloc.add(
                                      LoadCorrectAnswer(
                                        answerSelected: questionState.question.answers[i],
                                      ),
                                    );
                                  },
                                  child: Text(
                                    questionState.question.answers[i].text,
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                          const SizedBox(height: 50),
                          questionState is CorrectQuestionLoaded
                              ? TextButton(
                                  onPressed: () {
                                    _quizScreenBloc.add(const QuizScreenEventLoadNextQuestion());
                                    _controller.reset();
                                    _controller.start();
                                  },
                                  child: const Text('Go Next'),
                                )
                              : const SizedBox.shrink(),
                        ],
                      );
                    }
                    return const SizedBox.shrink();
                  },
                );
              } else if (quizScreenState is QuizScreenQuizFinished) {
                return const Center(
                  child: Text('Finished?'),
                );
              }

              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}

class QuizScreenArguments {
  final bool hasCountdown;

  const QuizScreenArguments({
    this.hasCountdown = false,
  });
}
