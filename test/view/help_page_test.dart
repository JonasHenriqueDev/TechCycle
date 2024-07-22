import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:techcycle/src/view/HelpPage.dart';

void main() {

  testWidgets('HelpPage displays correct section titles and content', (WidgetTester tester) async {
    // Inicialize o teste com a HelpPage
    await tester.pumpWidget(
      MaterialApp(
        home: HelpPage(),
      ),
    );

    // Verifique se os títulos das seções estão presentes
    expect(find.text('Navegação'), findsOneWidget);
    expect(find.text('Menu Lateral'), findsOneWidget);
    expect(find.text('Localização do Usuário'), findsOneWidget);

    // Verifique se o conteúdo das seções está presente
    expect(
      find.textContaining('Utilize a barra de navegação inferior para acessar as principais seções do aplicativo'),
      findsOneWidget,
    );
    expect(
      find.textContaining('O menu lateral oferece acesso rápido a várias páginas importantes'),
      findsOneWidget,
    );
    expect(
      find.textContaining('O aplicativo utiliza a sua localização para mostrar pontos de coleta próximos'),
      findsOneWidget,
    );
  });

  testWidgets('HelpPage displays central text with correct styling', (WidgetTester tester) async {
    // Inicialize o teste com a HelpPage
    await tester.pumpWidget(
      MaterialApp(
        home: HelpPage(),
      ),
    );

    // Verifique se o texto central está presente e estilizado corretamente
    final textWidget = find.text('Bem-vindo ao Suporte do TechCycle');
    expect(textWidget, findsOneWidget);

    final text = tester.widget<Text>(textWidget);
    expect(text.style?.fontSize, 30);
    expect(text.style?.fontWeight, FontWeight.bold);
  });

  testWidgets('HelpPage displays content within SingleChildScrollView', (WidgetTester tester) async {
    // Inicialize o teste com a HelpPage
    await tester.pumpWidget(
      MaterialApp(
        home: HelpPage(),
      ),
    );

    // Verifique se o corpo da página está dentro de um SingleChildScrollView
    final scrollView = find.byType(SingleChildScrollView);
    expect(scrollView, findsOneWidget);
  });
}