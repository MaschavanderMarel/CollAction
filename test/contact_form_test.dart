// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:collaction_app/main.dart';

void main() {
   testWidgets('Contact form renders', (WidgetTester tester) async {
    // Build our app and contact form.
    await tester.pumpWidget(MyApp());
    await tester.tap(find.text('Give feedback or start crowd action'));
    await tester.pumpAndSettle();

    // Verify that the page is rendered with all its elements.
   // final finder = find.text("Contact form");
   expect(find.text("Contact form"), findsOneWidget);
   expect(find.byType(TextFormField), findsNWidgets(2));
   expect(find.text("Submit"), findsOneWidget);
  });

   testWidgets('Form can be submitted', (WidgetTester tester) async {
     // Build app and contact form
     await tester.pumpWidget(MyApp());
     await tester.tap(find.text('Give feedback or start crowd action'));
     await tester.pumpAndSettle();

     final Finder emailAddress = find.widgetWithText(TextFormField, 'Your email address');
     final Finder feedback = find.widgetWithText(TextFormField, 'Your feedback or request');
     final Finder submit = find.widgetWithText(ElevatedButton, 'Submit');

     expect(find.text('Processing data'), findsNothing);

     await tester.enterText(emailAddress, 'example@mail.com');
     await tester.enterText(feedback, 'blablabla');

     await tester.tap(submit);
     await tester.pump();

     expect(find.text('Processing data'), findsOneWidget);

  });
}
