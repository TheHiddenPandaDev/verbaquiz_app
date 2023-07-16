part of '../splash_screen.dart';

class VerbaQuizLogo extends StatelessWidget {
  const VerbaQuizLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/splash_screen/verbaquiz_logo.png',
      width: 120,
    );
  }
}
