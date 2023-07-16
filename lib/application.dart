import 'package:flutter/material.dart';
import 'package:verbaquiz/routes.dart';
import 'package:verbaquiz/ui/screens/splash_screen/splash_screen.dart';

class VerbaQuiz extends StatelessWidget {
  const VerbaQuiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
