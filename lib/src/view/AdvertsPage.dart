import 'package:flutter/material.dart';

class AdvertsPage extends StatelessWidget {
  const AdvertsPage({super.key});

  void callbackFuntion() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Meus anúncios e vendas', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Colors.grey[300], // Cor de fundo para a linha
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/tvplaceholder.png',
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Text(
                      'Tv de tubo que não pega \n'
                          'Valor: R\$ 40,00\n'
                            'Status: Vendido',
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              color: Colors.grey[300], // Cor de fundo para a linha
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/tvplaceholder.png',
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Text(
                      'Tv de tubo que não pega \n'
                          'Valor: R\$ 40,00\n'
                            'Status: Anunciado',
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}