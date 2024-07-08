import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:techcycle/src/view/NotificationsPage.dart';

void main() {
  testWidgets('NotificationsPage has a title and a central text', (WidgetTester tester) async {
    // Inicialize o teste com a NotificationsPage
    await tester.pumpWidget(
      MaterialApp(
        home: NotificationsPage(),
      ),
    );

    // Verifique se o AppBar tem o título correto
    expect(find.text('Notificações'), findsOneWidget);

    // Verifique se o texto central está presente
    expect(find.text('Essas são suas notificações'), findsOneWidget);
  });

  testWidgets('NotificationsPage has an AppBar with correct properties', (WidgetTester tester) async {
    // Inicialize o teste com a NotificationsPage
    await tester.pumpWidget(
      MaterialApp(
        home: NotificationsPage(),
      ),
    );

    // Verifique se o AppBar está presente
    final appBar = find.byType(AppBar);
    expect(appBar, findsOneWidget);

    // Verifique se o AppBar tem a cor de fundo correta
    final appBarWidget = tester.widget<AppBar>(appBar);
    expect(appBarWidget.backgroundColor, Colors.green);

    // Verifique se o ícone tem a cor correta
    final iconTheme = appBarWidget.iconTheme;
    expect(iconTheme?.color, Colors.white);
  });

  testWidgets('NotificationsPage central text is centered', (WidgetTester tester) async {
    // Inicialize o teste com a NotificationsPage
    await tester.pumpWidget(
      MaterialApp(
        home: NotificationsPage(),
      ),
    );

    // Verifique se o texto central está dentro de um widget Center
    final centerWidget = find.byType(Center);
    expect(centerWidget, findsOneWidget);

    // Verifique se o texto central está dentro do Center
    final textWidget = find.descendant(of: centerWidget, matching: find.text('Essas são suas notificações'));
    expect(textWidget, findsOneWidget);
  });
}
