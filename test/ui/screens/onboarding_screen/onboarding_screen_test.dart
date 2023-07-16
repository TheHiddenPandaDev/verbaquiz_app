import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:verbaquiz/ui/screens/onboarding_screen/onboarding_screen.dart';

void main() {
  group('Onboarding Test', () {
    testWidgets('Pump and test widget', (WidgetTester tester) async {

      await tester.pumpWidget(
        const MaterialApp(
          home: OnboardingScreen(),
        ),
      );

      expect(find.image(const AssetImage('assets/onboarding_screen/verbaquiz_logo.png')), findsOneWidget);

      Finder textFinder = find.text('TheHiddenPanda');
      expect(textFinder, findsOneWidget);

      Text text = tester.firstWidget(textFinder);
      expect(text.style?.fontFamily, 'KuaiLe');

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('../../goldens/onboarding_screen.png'),
      );
    });
  });
}
