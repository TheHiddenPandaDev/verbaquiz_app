import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:verbaquiz/domain/services/ui/homepage_router_service.dart';

part 'login_screen_event.dart';
part 'login_screen_state.dart';

@lazySingleton
class LoginScreenBloc extends Bloc<LoginScreenEvent, LoginScreenState> {
  final HomePageRouterService _homePageRouterService;

  LoginScreenBloc(
    this._homePageRouterService,
  ) : super(const LoginScreenInitial()) {
    on<LoginScreenGetNextPageEvent>(_handleGetNextPageEvent);
  }

  Future<void> _handleGetNextPageEvent(
    LoginScreenGetNextPageEvent event,
    Emitter<LoginScreenState> emit,
  ) async {
    final String nextPage = await _homePageRouterService.getNextPage();
    emit(LoginScreenGotNextPage(nextPage: nextPage));
  }
}
