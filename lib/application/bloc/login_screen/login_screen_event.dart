part of 'login_screen_bloc.dart';

abstract class LoginScreenEvent extends Equatable {
  const LoginScreenEvent();
}

// Events to Load information

class LoginScreenGetNextPageEvent extends LoginScreenEvent {
  const LoginScreenGetNextPageEvent();

  @override
  List<Object?> get props => [];
}
