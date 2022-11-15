import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:youniversity_app/layout/app_theme.dart';
import 'package:youniversity_app/main.dart';
import 'package:youniversity_app/pages/auth/repository/auth_repository.dart';

void main() {
  const headers = {'Content-Type': 'application/json'};

  testWidgets('Routing changes the app bar title', (tester) async {
    // Create the mock client for the AuthRepository
    final client = MockClient((request) async {
      final body = jsonEncode({'jwt': 'token'});
      return Response(body, 200, headers: headers);
    });

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      YOUniversityApp(
        theme: theme,
        authRepository: AuthRepository(client: client),
      ),
    );

    // Find text fields
    final email = find.byKey(const ValueKey('SignInPage_Email_TextField'));
    final password =
        find.byKey(const ValueKey('SignInPage_Password_TextField'));

    // Fill tester login info
    await tester.enterText(email, 'john@doe.com');
    await tester.enterText(password, '12345678');
    await tester.pump();

    // Click the login button and wait for it to load
    await tester.tap(find.widgetWithText(ElevatedButton, 'INICIAR SESIÓN'));
    await tester.pumpAndSettle(const Duration(milliseconds: 100));

    // Verify that out AppBar is rendering the title correctly
    expect(find.text('INICIO'), findsOneWidget);
    expect(find.text('HORARIO'), findsNothing);

    // Tap the timetable icon and trigger a route change.
    await tester.tap(find.byIcon(Icons.date_range));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('INICIO'), findsNothing);
    expect(find.text('HORARIO'), findsOneWidget);
  });
}
