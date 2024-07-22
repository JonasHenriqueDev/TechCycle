import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:techcycle/src/view/NotificationsPage.dart';

void main() {
  testWidgets('NotificationsPage displays AppBar with correct title and properties', (WidgetTester tester) async {
    // Inicialize o teste com a NotificationsPage
    await tester.pumpWidget(
      MaterialApp(
        home: NotificationsPage(),
      ),
    );

    // Verifique se o AppBar está presente e com o título correto
    expect(find.text('Notificações'), findsOneWidget);

    // Verifique se o AppBar tem a cor de fundo correta
    final appBar = find.byType(AppBar);
    expect(appBar, findsOneWidget);
    final appBarWidget = tester.widget<AppBar>(appBar);
    expect(appBarWidget.backgroundColor, Colors.green);

    // Verifique se a cor do ícone do AppBar está correta
    final iconTheme = appBarWidget.iconTheme;
    expect(iconTheme?.color, Colors.white);
  });

  testWidgets('NotificationsPage displays a list of notifications', (WidgetTester tester) async {
    // Inicialize o teste com a NotificationsPage com notificações
    await tester.pumpWidget(
      MaterialApp(
        home: NotificationsPage(),
      ),
    );

    // Verifique se as notificações estão presentes na lista
    for (var i = 0; i < 4; i++) {
      expect(find.text('Notificação ${i + 1}'), findsOneWidget);
    }

    // Verifique se os ícones de notificação estão presentes
    expect(find.byIcon(Icons.notifications), findsNWidgets(4));
  });

  testWidgets('NotificationsPage notification list items are tappable', (WidgetTester tester) async {
    // Inicialize o teste com a NotificationsPage com notificações
    await tester.pumpWidget(
      MaterialApp(
        home: NotificationsPage(),
      ),
    );

    // Verifique se a lista de notificações é interativa
    final firstNotification = find.text('Notificação 1');
    expect(firstNotification, findsOneWidget);
    await tester.tap(firstNotification);
    await tester.pump();

    // Adicione a verificação de interação se necessário
    // Por exemplo, você pode verificar se algum efeito ocorre após o toque
  });
}