import 'package:flutter/material.dart';
import 'package:techcycle/src/model/anuncio.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AnuncioProvider with ChangeNotifier {
  List<Anuncio> _anuncios = [];
  bool _isLoading = false;

  List<Anuncio> get anuncios => _anuncios;
  bool get isLoading => _isLoading;

  final String apiUrl = "https://techcycleapi-7e5c7fce464b.herokuapp.com/api/anuncios";

  Future<void> fetchAnuncios() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        List jsonResponse = json.decode(utf8.decode(response.bodyBytes));
        _anuncios = jsonResponse.map((anuncio) => Anuncio.fromJson(anuncio)).toList();
      } else {
        print('Falha ao carregar anúncios');
      }
    } catch (e) {
      print('Erro: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addAnuncio(String title, String description, double price) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'titulo': title,
          'descricao': description,
          'preco': price,
        }),
      );

      if (response.statusCode == 201) {
        // Sucesso ao adicionar o anúncio
        // Atualiza a lista de anúncios
        await fetchAnuncios();
      } else {
        print('Falha ao adicionar anúncio');
      }
    } catch (e) {
      print('Erro: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
