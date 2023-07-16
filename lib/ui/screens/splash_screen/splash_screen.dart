import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:page_transition/page_transition.dart';
import 'package:verbaquiz/application/bloc/splash_screen/splash_screen_bloc.dart';
import 'package:verbaquiz/routes.dart';

part 'widgets/thehiddenpanda_logo.dart';
part 'widgets/verbaquiz_logo.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash';

  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashScreenBloc _splashScreenBloc =
      GetIt.instance.get<SplashScreenBloc>();

  @override
  void initState() {
    super.initState();
    _splashScreenBloc.add(const SplashScreenGetNextPageEvent());

    _splashScreenBloc.stream.listen((SplashScreenState state) {
      if (state is SplashScreenGotNextPage) {
        final NavigatorState navigator = Navigator.of(context);

        navigator.push(
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
          color: Colors.black,
          child: const SafeArea(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: VerbaQuizLogo(),
                ),
                Positioned(
                  bottom: 40,
                  child: Center(
                    child: TheHiddenPandaLogo(),
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
