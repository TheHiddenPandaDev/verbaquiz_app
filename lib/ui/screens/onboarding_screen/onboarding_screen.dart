import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'widgets/thehiddenpanda_logo.dart';
part 'widgets/verbaquiz_logo.dart';

class OnboardingScreen extends StatelessWidget {
  static const String routeName = '/onboarding';

  const OnboardingScreen({
    Key? key,
  }) : super(key: key);

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
