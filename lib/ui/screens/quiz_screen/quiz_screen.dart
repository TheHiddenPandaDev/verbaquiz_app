import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
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
            builder: (context, state) {
              if(state is QuizScreenInitial) {
                _quizScreenBloc.add(const QuizScreenEventLoadQuiz());
                return const Center(
                  child: Text('Loading...'),
                );
              }
              return const Center(
                child: Text('Quiz'),
              );

            },
          ),
        ],
      ),
    );
  }
}
