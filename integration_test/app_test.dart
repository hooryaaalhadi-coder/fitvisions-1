import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:fitvisions/main.dart';

void main() {

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    'Full app integration test',
    (WidgetTester tester) async {

      await tester.pumpWidget(
        const FitVisionsApp(),
      );

      await tester.pumpAndSettle();

      expect(
        find.text('LOGIN'),
        findsOneWidget,
      );

      await tester.tap(
        find.text('LOGIN'),
      );

      await tester.pumpAndSettle();

      expect(
        find.text('Forget Password ?'),
        findsOneWidget,
      );
    },
  );
}