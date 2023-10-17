import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:verbaquiz/domain/services/ui/homepage_router_service.dart';

part 'splash_screen_event.dart';
part 'splash_screen_state.dart';

@lazySingleton
class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  final HomePageRouterService _homePageRouterService;

  SplashScreenBloc(
    this._homePageRouterService,
  ) : super(const SplashScreenInitial()) {
    on<SplashScreenGetNextPageEvent>(_handleGetNextPageEvent);
  }

  Future<void> _handleGetNextPageEvent(
    SplashScreenGetNextPageEvent event,
    Emitter<SplashScreenState> emit,
  ) async {
    final String nextPage = await _homePageRouterService.getNextPage();
    emit(SplashScreenGotNextPage(nextPage: nextPage));
  }
}
