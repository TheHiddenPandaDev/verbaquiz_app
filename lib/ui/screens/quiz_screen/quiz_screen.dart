import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:verbaquiz/application/bloc/question/question_bloc.dart';
import 'package:verbaquiz/application/bloc/quiz_screen/quiz_screen_bloc.dart';
import 'package:verbaquiz/domain/model/objects/answer.dart';


part 'widgets/quiz_finished/quiz_finished.dart';
part 'widgets/quiz_loaded/quiz_loaded.dart';
part 'widgets/quiz_loaded/widgets/count_down_timer/count_down_timer.dart';
part 'widgets/quiz_loaded/widgets/next_question_btn/next_question_btn.dart';
part 'widgets/quiz_loaded/widgets/question_answers/question_answers.dart';
part 'widgets/quiz_loaded/widgets/question_text/question_text.dart';
part 'widgets/quiz_loaded/widgets/questions_counter/questions_counter.dart';

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
                return QuizLoaded(hasCountDown: arguments?.hasCountDown ?? false);
              } else if (quizScreenState is QuizScreenQuizFinished) {
                return const QuizFinished();
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
  final bool hasCountDown;

  const QuizScreenArguments({
    this.hasCountDown = false,
  });
}
