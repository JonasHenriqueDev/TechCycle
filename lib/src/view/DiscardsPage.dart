import 'package:flutter/material.dart';

class DiscardsPage extends StatelessWidget {
  const DiscardsPage({super.key});

  void callbackFuntion() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico de descartes', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(
                  'assets/images/fotoperfil.png'), // Substitua pela URL da sua imagem de perfil
            ),
            const SizedBox(height: 20),
            const Text(
              'Jonas Henrique',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Divider(color: Colors.grey[400], thickness: 1, height: 40),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  '999 descartes corretos realizados',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Divider(color: Colors.grey, thickness: 1, height: 40),
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
                              'Valor: R\$ 40,00',
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
                              'Valor: R\$ 40,00',
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
