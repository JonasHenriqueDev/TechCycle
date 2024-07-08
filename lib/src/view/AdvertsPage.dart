import 'package:flutter/material.dart';

class AdvertsPage extends StatelessWidget {
  const AdvertsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Meus anúncios e vendas',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: const Center(
        child: Text('Este são seus anúncios e vendas'),
      ),
    );
  }
}
