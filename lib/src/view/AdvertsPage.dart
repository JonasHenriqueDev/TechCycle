import 'package:flutter/material.dart';

class AdvertsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Meus anúncios e vendas',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Text('Este são seus anúncios e vendas'),
      ),
    );
  }
}
