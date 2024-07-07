// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:techcycle/main.dart';
//
// void main() {
//   testWidgets('Navigation bar items test', (WidgetTester tester) async {
//     await tester.pumpWidget(MyApp());
//
//     expect(find.text('TechCycle'), findsOneWidget);
//     expect(find.text('Você selecionou a aba: 0'), findsOneWidget);
//     expect(
//       (tester.firstWidget(find.byType(AppBar)) as AppBar).backgroundColor,
//       Colors.green,
//     );
//
//     // O Drawer está fechado inicialmente
//     expect(find.byType(Drawer), findsNothing);
//
//     // Abre o Drawer
//     await tester.tap(find.byIcon(Icons.menu));
//     await tester.pumpAndSettle();
//
//     // Verifica se o Drawer está aberto após o clique
//     expect(find.byType(Drawer), findsOneWidget);
//
//     // Clica na opção "Minha conta"
//     await tester.tap(find.text('Minha conta'));
//     await tester.pumpAndSettle();
//
//     // Verifica se o texto da aba foi atualizado
//     expect(find.text('Você selecionou a aba: 0'), findsOneWidget);
//
//     // Verifica se o Drawer foi fechado após o clique
//     expect(find.byType(Drawer), findsNothing);
//
//     // Verifica se a cor de fundo do BottomNavigationBar é verde
//     expect(
//       (tester.firstWidget(find.byType(BottomNavigationBar)) as BottomNavigationBar).backgroundColor,
//       Colors.green,
//     );
//
//     // Clica no segundo ícone do BottomNavigationBar
//     await tester.tap(find.byIcon(Icons.location_on));
//     await tester.pumpAndSettle();
//
//     // Verifica se o texto da aba foi atualizado
//     expect(find.text('Você selecionou a aba: 1'), findsOneWidget);
//   });
// }
