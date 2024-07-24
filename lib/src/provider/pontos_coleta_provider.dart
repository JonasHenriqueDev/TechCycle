import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:techcycle/src/model/ponto_coleta.dart';

class PontosColetaProvider with ChangeNotifier {
  List<PontoColeta> _pontos_coletas = [];
  bool _isLoading = false;

  List<PontoColeta> get pontos_coletas => _pontos_coletas;
  bool get isLoading => _isLoading;

  final String apiUrl = "https://techcycleapi-7e5c7fce464b.herokuapp.com/api/pontos-coleta";

  Future<void> fetchPontosColetas() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // Decodifica a resposta JSON
        List jsonResponse = json.decode(utf8.decode(response.bodyBytes));

        // Converte a lista JSON em uma lista de objetos PontoColeta
        _pontos_coletas = jsonResponse.map((ponto_coleta) => PontoColeta.fromJson(ponto_coleta as Map<String, dynamic>)).toList();

        print(_pontos_coletas);
      } else {
        print('Falha ao carregar pontos de coleta');
      }
    } catch (e) {
      print('Erro: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Set<Marker> get markers {
    return _pontos_coletas.map((ponto_coleta) {
      return Marker(
        markerId: MarkerId(ponto_coleta.id.toString()),
        position: LatLng(ponto_coleta.latitude, ponto_coleta.longitude),
        infoWindow: InfoWindow(title: ponto_coleta.nome),
      );
    }).toSet();
  }
}
