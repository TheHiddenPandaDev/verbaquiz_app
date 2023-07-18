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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<QuizScreenBloc, QuizScreenState>(
            bloc: _quizScreenBloc,
            builder: (context, quizScreenState) {
              if(quizScreenState is QuizScreenInitial){
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
                          TextButton(
                            onPressed: () => _quizScreenBloc.add(const QuizScreenEventLoadNextQuestion()),
                            child: const Text('Go Next'),
                          ),
                        ],
                      );
                    }
                    return const SizedBox.shrink();
                  },
                );
              }

              return const Center(
                child: Text('Finished?'),
              );

            },
          ),
        ],
      ),
    );
  }
}
