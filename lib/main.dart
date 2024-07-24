import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techcycle/src/provider/anuncio_provider.dart';
import 'package:techcycle/src/provider/pontos_coleta_provider.dart';
import 'package:techcycle/src/provider/recompensa_provider.dart';
import 'package:techcycle/src/view/LoginPage.dart'; // Certifique-se de criar a LoginPage
import 'package:techcycle/src/view/HomePage.dart'; // Certifique-se de criar a HomePage
import 'package:techcycle/src/view/LoadingPage.dart'; // Importa a nova tela de carregamento

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AnuncioProvider()),
        ChangeNotifierProvider(create: (context) => RecompensaProvider()),
        ChangeNotifierProvider(create: (context) => PontosColetaProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TechCycle',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/loading', // Define a rota inicial como a tela de carregamento
      routes: {
        '/loading': (context) => LoadingPage(), // Rota para a tela de carregamento
        '/login': (context) => LoginPage(), // Rota para a tela de login
        '/home': (context) => HomeScreen(), // Rota para a tela principal
      },
    );
  }
}
