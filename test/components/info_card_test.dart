import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:youniversity_app/components/info_card.dart';
import 'package:youniversity_app/layout/app_theme.dart';

Widget createApp(Widget widget) {
  return MaterialApp(
    title: 'Testing App',
    theme: theme,
    home: Scaffold(
      body: widget,
    ),
  );
}

void main() {
  group('InfoCard Widget', () {
    const title = 'Title';

    testWidgets('Should display title', (tester) async {
      final widget = InfoCard(title: const Text(title));
      await tester.pumpWidget(createApp(widget));

      expect(find.text(title), findsOneWidget);
    });

    testWidgets('Should display title and children with spacers',
        (tester) async {
      final widget = InfoCard(
        title: const Text(title),
        children: [1, 2].map((e) => Text('Children $e')).toList(),
      );
      await tester.pumpWidget(createApp(widget));

      expect(find.text(title), findsOneWidget);
      expect(find.byType(SizedBox), findsNWidgets(3));
      for (final e in [1, 2]) {
        expect(find.text('Children $e'), findsOneWidget);
      }
    });
  });

  group('InfoCardItem Widget', () {
    const content = 'content for the widget';

    testWidgets('Should display child', (tester) async {
      const widget = InfoCardItem(child: Text(content));
      await tester.pumpWidget(createApp(widget));

      expect(find.text(content), findsOneWidget);
    });

    testWidgets('Should display child and leading', (tester) async {
      const widget = InfoCardItem(
        leading: Icon(Icons.abc),
        child: Text(content),
      );
      await tester.pumpWidget(createApp(widget));

      expect(find.byIcon(Icons.abc), findsOneWidget);
      expect(find.text(content), findsOneWidget);
    });

    testWidgets('Should display child, leading and trailing', (tester) async {
      const widget = InfoCardItem(
        leading: Icon(Icons.abc),
        trailing: Icon(Icons.access_alarm),
        child: Text(content),
      );
      await tester.pumpWidget(createApp(widget));

      expect(find.byIcon(Icons.abc), findsOneWidget);
      expect(find.byIcon(Icons.access_alarm), findsOneWidget);
      expect(find.text(content), findsOneWidget);
    });
  });
}
