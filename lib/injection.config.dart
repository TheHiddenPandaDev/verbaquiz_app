// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'application/bloc/question/question_bloc.dart' as _i5;
import 'application/bloc/quiz_screen/quiz_screen_bloc.dart' as _i10;
import 'application/bloc/splash_screen/splash_screen_bloc.dart' as _i11;
import 'domain/repositories/quiz_repository.dart' as _i6;
import 'domain/services/http_service.dart' as _i3;
import 'domain/services/ui/quiz_service.dart' as _i8;
import 'domain/services/ui/splash_service.dart' as _i9;
import 'infrastructure/repositories/quiz/mock_quiz_repository.dart' as _i7;
import 'infrastructure/services/http_service.dart' as _i4;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.HttpService>(() => _i4.FlutterHttpService());
  gh.lazySingleton<_i5.QuestionBloc>(() => _i5.QuestionBloc());
  gh.factory<_i6.QuizRepository>(() => _i7.MockQuizRepository());
  gh.factory<_i8.QuizService>(() => _i8.QuizService(gh<_i6.QuizRepository>()));
  gh.factory<_i9.SplashService>(() => _i9.SplashService());
  gh.lazySingleton<_i10.QuizScreenBloc>(() => _i10.QuizScreenBloc(
        gh<_i8.QuizService>(),
        gh<_i5.QuestionBloc>(),
      ));
  gh.lazySingleton<_i11.SplashScreenBloc>(
      () => _i11.SplashScreenBloc(gh<_i9.SplashService>()));
  return getIt;
}
