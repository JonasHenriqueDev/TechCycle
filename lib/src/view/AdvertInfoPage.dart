import 'dart:math';

import 'package:flutter/material.dart';
import 'package:techcycle/src/model/anuncio.dart';

class AdvertInfoPage extends StatelessWidget {
  final Anuncio anuncio;

  AdvertInfoPage({required this.anuncio});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(anuncio.titulo),
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(anuncio.imageUrl),
                const SizedBox(height: 16),
                Text(
                  anuncio.titulo,
                  style: const TextStyle(
                      fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Text(
                  anuncio.descricao,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
                Text(
                  'R\$ ${anuncio.preco.toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                FloatingActionButton.extended(
                  onPressed: () {},
                  backgroundColor: Colors.green,
                  label: Text(
                    'Chat',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  icon: Icon(
                    Icons.chat,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
