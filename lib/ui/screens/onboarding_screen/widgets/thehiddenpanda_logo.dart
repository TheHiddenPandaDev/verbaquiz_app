part of '../onboarding_screen.dart';

class TheHiddenPandaLogo extends StatelessWidget {
  const TheHiddenPandaLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'from',
          style: TextStyle(
            color: Color(0xFF697886),
          ),
        ),
        SizedBox(height: 10),
        Text(
          'TheHiddenPanda',
          style: TextStyle(
            fontFamily: 'KuaiLe',
            fontSize: 18,
            color: Color(0xFFF5897F),
          ),
        ),
      ],
    );
  }
}
