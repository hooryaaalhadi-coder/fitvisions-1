import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fitvisions/main.dart';

void main() {

  testWidgets(
    'First name validation test',
    (WidgetTester tester) async {

      await tester.pumpWidget(
        const FitVisionsApp(),
      );

      await tester.pumpAndSettle();

      await tester.tap(
        find.text('REGISTER'),
      );

      await tester.pumpAndSettle();

      await tester.enterText(
        find.byType(TextField).at(0),
        'Ahmed Mohammed',
      );

      await tester.enterText(
        find.byType(TextField).at(1),
        'Ali',
      );

      await tester.enterText(
        find.byType(TextField).at(2),
        '91234567',
      );

      await tester.enterText(
        find.byType(TextField).at(3),
        'test@gmail.com',
      );

      await tester.enterText(
        find.byType(TextField).at(4),
        'Aa@12345',
      );

      await tester.enterText(
        find.byType(TextField).at(5),
        'Aa@12345',
      );

      await tester.tap(
        find.text('SIGN UP'),
      );

      await tester.pumpAndSettle();

      expect(
        find.textContaining(
          'First name must be',
        ),
        findsOneWidget,
      );
    },
  );
}