import 'package:flutter/material.dart';

class DiscardsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Histórico de descartes',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        actionsIconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Text('Este é seu histórico de descarates'),
      ),
    );
  }
}
