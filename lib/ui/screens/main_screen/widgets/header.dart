part of '../main_screen.dart';

class Header extends StatelessWidget {

  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/onboarding_screen/background.png"),
          alignment: Alignment.centerRight,
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        color: Colors.black.withOpacity(0.80),
        child: Align(
          alignment: Alignment.center,
          child: Image.asset(
            'assets/onboarding_screen/verbaquiz_and_morty_logo.png',
          ),
        ),
      ),
    );
  }
}
