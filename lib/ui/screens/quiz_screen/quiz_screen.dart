import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  static const String routeName = '/Quiz';

  const QuizScreen({
    super.key,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> with WidgetsBindingObserver {
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
    return const Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('Quiz'),
          ),
        ],
      ),
    );
  }
}
