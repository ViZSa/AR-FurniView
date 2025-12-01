// This is a basic Flutter widget test.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ar_furniview/main.dart';

void main() {
  testWidgets('App starts and shows home screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ARFurniViewApp());

    // Verify that the app bar shows the correct title
    expect(find.text('AR FurniView'), findsOneWidget);

    // Verify that search field is present
    expect(find.byType(TextField), findsOneWidget);
  });
}
