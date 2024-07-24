import 'package:flutter/material.dart';
import 'dart:async'; // Para usar o Future.delayed

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

  @override
  void initState() {
    super.initState();
    _startLoading();
  }

  void _startLoading() async {
    // Simula um atraso de 2 segundos antes de redirecionar para a tela de login
    await Future.delayed(Duration(seconds: 2));
    Navigator.of(context).pushReplacementNamed('/login'); // Navega para a tela de login após o carregamento
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade200, // Cor de fundo do carregamento
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: Colors.green.shade700, // Cor do indicador de progresso
            ),
            SizedBox(height: 20),
            Text(
              'Carregando...',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
