import 'package:flutter/material.dart';
import 'package:verbaquiz/ui/screens/home_screen/home_screen.dart';
import 'package:verbaquiz/ui/screens/login_screen/login_screen.dart';
import 'package:verbaquiz/ui/screens/quiz_screen/quiz_screen.dart';
import 'package:verbaquiz/ui/screens/splash_screen/splash_screen.dart';
import 'package:verbaquiz/ui/screens/question_details_screen/question_details_screen.dart';

Map<String, WidgetBuilder> _routeGenerator() {
  final Map<String, WidgetBuilder> routes = {
    SplashScreen.routeName: (_) => const SplashScreen(),
    LoginScreen.routeName: (_) => const LoginScreen(),
    HomeScreen.routeName: (_) => const HomeScreen(),
    QuizScreen.routeName: (_) => const QuizScreen(),
    QuestionDetailsScreen.routeName: (_) => const QuestionDetailsScreen(),
  };

  return routes;
}

final routes = _routeGenerator();

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
