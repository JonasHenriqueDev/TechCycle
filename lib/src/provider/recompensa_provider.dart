import 'package:flutter/material.dart';
import 'package:techcycle/src/model/recompensa.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class RecompensaProvider with ChangeNotifier {
  List<Recompensa> _recompensas = [];
  bool _isLoading = false;

  List<Recompensa> get recompensa => _recompensas;
  bool get isLoading => _isLoading;

  final String apiUrl = "https://techcycleapi-7e5c7fce464b.herokuapp.com/api/recompensa";

  Future<void> fetchRecompensas() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        List jsonResponse = json.decode(utf8.decode(response.bodyBytes));
        _recompensas = jsonResponse.map((recompensa) => Recompensa.fromJson(recompensa)).toList();
        // print(jsonResponse.toString());
      } else {
        print('Falha ao carregar recompensas');
      }
    } catch (e) {
      print('Erro: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
