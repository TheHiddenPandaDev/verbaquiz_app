import 'package:flutter/material.dart';

class TheHiddenPandaLogo extends StatelessWidget {
  const TheHiddenPandaLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5.8, horizontal: 7.5), // Border width
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(3)),
            border: Border.all(color: const Color(0xff12555F), width: 2),
          ),
          child: const Text('The Hidden Panda'),
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}
