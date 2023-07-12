import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:verbaquiz/application.dart";
import 'package:verbaquiz/injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const VerbaQuiz());
}
