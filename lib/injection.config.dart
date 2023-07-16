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

import 'application/bloc/main_screen/main_screen_bloc.dart' as _i9;
import 'application/bloc/splash_screen/splash_screen_bloc.dart' as _i10;
import 'domain/repositories/question_api_repository.dart' as _i5;
import 'domain/services/http_service.dart' as _i3;
import 'domain/services/ui/question_service.dart' as _i7;
import 'domain/services/ui/splash_service.dart' as _i8;
import 'infrastructure/repositories/question/http_question_repository.dart'
    as _i6;
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
  gh.factory<_i5.QuestionApiRepository>(
      () => _i6.HttpQuestionRepository(gh<_i3.HttpService>()));
  gh.factory<_i7.QuestionService>(
      () => _i7.QuestionService(gh<_i5.QuestionApiRepository>()));
  gh.factory<_i8.SplashService>(() => _i8.SplashService());
  gh.lazySingleton<_i9.MainScreenBloc>(
      () => _i9.MainScreenBloc(gh<_i7.QuestionService>()));
  gh.lazySingleton<_i10.SplashScreenBloc>(
      () => _i10.SplashScreenBloc(gh<_i8.SplashService>()));
  return getIt;
}
