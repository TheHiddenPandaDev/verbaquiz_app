import 'package:flutter/material.dart';
import 'package:verbaquiz/ui/common/widgets/the_hidden_panda_logo.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
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
        child: const Align(
          alignment: Alignment.center,
          child: TheHiddenPandaLogo(),
        ),
      ),
    );
  }
}
