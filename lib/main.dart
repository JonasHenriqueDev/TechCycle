import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techcycle/src/provider/anuncio_provider.dart';
import 'package:techcycle/src/provider/pontos_coleta_provider.dart';
import 'package:techcycle/src/provider/recompensa_provider.dart';
import 'package:techcycle/src/view/LoginPage.dart'; // Certifique-se de criar o LoginPage
import 'package:techcycle/src/view/HomePage.dart';

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
      initialRoute: '/login', // Defina a rota inicial para a tela de login
      routes: {
        '/login': (context) => LoginPage(), // Rota para a tela de login
        '/home': (context) => HomeScreen(), // Rota para a tela principal
      },
    );
  }
}
