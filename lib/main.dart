import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techcycle/src/provider/anuncio_provider.dart';
import 'package:techcycle/src/provider/recompensa_provider.dart';
import 'package:techcycle/src/view/HomePage.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AnuncioProvider()),
        ChangeNotifierProvider(create: (context) => RecompensaProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

