import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:verbaquiz/ui/screens/splash_screen/splash_screen.dart';

void main() {
  group('Splash Screen Test', () {
    testWidgets('Pump and test widget', (WidgetTester tester) async {

      await tester.pumpWidget(
        const MaterialApp(
          home: SplashScreen(),
        ),
      );

      expect(find.image(const AssetImage('assets/splash_screen/verbaquiz_logo.png')), findsOneWidget);

      Finder textFinder = find.text('TheHiddenPanda');
      expect(textFinder, findsOneWidget);

      Text text = tester.firstWidget(textFinder);
      expect(text.style?.fontFamily, 'KuaiLe');

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('../../goldens/splash_screen.png'),
      );
    });
  });
}
