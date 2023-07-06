import 'package:flutter/material.dart';
import 'package:verbaquiz/ui/screens/main_screen/main_screen.dart';
import 'package:verbaquiz/ui/screens/onboarding_screen/onboarding_screen.dart';
import 'package:verbaquiz/ui/screens/question_details_screen/question_details_screen.dart';

Map<String, WidgetBuilder> _routeGenerator() {
  final Map<String, WidgetBuilder> routes = {
    OnboardingScreen.routeName: (_) => const OnboardingScreen(),
    MainScreen.routeName: (_) => MainScreen(),
    QuestionDetailsScreen.routeName: (_) => const QuestionDetailsScreen(),
  };

  return routes;
}

final routes = _routeGenerator();

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
