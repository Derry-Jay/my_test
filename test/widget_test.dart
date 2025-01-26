// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:common_utils/common_utils.dart';
// import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:my_test/my_app.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect('0'.getTextFinder(), findsOneWidget);
    expect('1'.getTextFinder(), findsNothing);

    // Tap the '+' icon and trigger a frame.
    // await tester.tap(Icons.add.getIconFinder());
    await tester.pump();

    // Verify that our counter has incremented.
    expect('0'.getTextFinder(), findsNothing);
    expect('1'.getTextFinder(), findsOneWidget);
  });
}
