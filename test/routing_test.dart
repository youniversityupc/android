import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:youniversity_app/layout/app_theme.dart';
import 'package:youniversity_app/main.dart';
import 'package:youniversity_app/pages/auth/repository/auth_repository.dart';

void main() {
  testWidgets('Routing changes the app bar title', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      YOUniversityApp(
        theme: theme,
        authRepository: AuthRepository(),
      ),
    );

    // Click the login button
    await tester.tap(find.widgetWithText(ElevatedButton, 'INICIAR SESIÓN'));
    await tester.pump();

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
