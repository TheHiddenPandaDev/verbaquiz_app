import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:page_transition/page_transition.dart';
import 'package:verbaquiz/application/bloc/login_screen/login_screen_bloc.dart';
import 'package:verbaquiz/routes.dart';
import 'package:verbaquiz/ui/screens/splash_screen/splash_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';

  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginScreenBloc _loginScreenScreenBloc = GetIt.instance.get<LoginScreenBloc>();

  @override
  void initState() {
    super.initState();

    _loginScreenScreenBloc.stream.listen((LoginScreenState state) {
      if (state is LoginScreenGotNextPage) {
        Navigator.of(context).push(
          PageTransition(
            type: PageTransitionType.fade,
            child: routes[state.nextPage]!(context),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.white,
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.black,
          child: SafeArea(
            child: Stack(
              alignment: Alignment.center,
              children: [
                TextButton(
                  onPressed: () => _loginScreenScreenBloc.add(const LoginScreenGetNextPageEvent()),
                  child: const Text('Login'),
                ),
                const Positioned(
                  bottom: 40,
                  child: Center(
                    child: VerbaQuizLogo(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
