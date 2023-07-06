import 'package:flutter/material.dart';
import 'package:verbaquiz/routes.dart';
import 'package:verbaquiz/ui/screens/onboarding_screen/onboarding_screen.dart';

class VerbaQuiz extends StatelessWidget {
  const VerbaQuiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: OnboardingScreen.routeName,
      routes: routes,
    );
  }
}
