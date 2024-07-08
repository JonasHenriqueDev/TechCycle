import 'package:flutter/material.dart';

class DiscardsPage extends StatelessWidget {
  const DiscardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Histórico de descartes',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        actionsIconTheme: IconThemeData(color: Colors.white),
      ),
      body: const Center(
        child: Text('Este é seu histórico de descarates'),
      ),
    );
  }
}
