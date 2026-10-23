import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rating_badge_app/rating_badge.dart';

void main() {
  testWidgets('Показує рейтинг з комою, зірку та підпис', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(body: RatingBadge(rating: 4.7, label: 'Відмінно')),
    ));
    expect(find.byIcon(Icons.star), findsOneWidget);
    expect(find.text('4,7'), findsOneWidget);
    expect(find.text('Відмінно'), findsOneWidget);
    final icon = tester.widget<Icon>(find.byIcon(Icons.star));
    expect(icon.color, Colors.green);
  });

  testWidgets('Без підпису, середній рейтинг помаранчевий', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(body: RatingBadge(rating: 3.2)),
    ));
    expect(find.text('3,2'), findsOneWidget);
    final icon = tester.widget<Icon>(find.byIcon(Icons.star));
    expect(icon.color, Colors.orange);
  });

  testWidgets('Низький рейтинг використовує колір помилки теми', (tester) async {
    final theme = ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue));
    await tester.pumpWidget(MaterialApp(
      theme: theme,
      home: const Scaffold(body: RatingBadge(rating: 1.2)),
    ));
    final icon = tester.widget<Icon>(find.byIcon(Icons.star));
    expect(icon.color, theme.colorScheme.error);
  });
}
