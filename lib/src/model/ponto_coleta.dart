class PontoColeta {
  final int id;
  final String nome;
  final double latitude;
  final double longitude;

  PontoColeta({
    required this.id,
    required this.nome,
    required this.latitude,
    required this.longitude,
  });

  factory PontoColeta.fromJson(Map<String, dynamic> json) {
    return PontoColeta(
      id: json['id'],
      nome: json['nome'],
      latitude: double.tryParse(json['latitude'].toString()) ?? 0.0,
      longitude: double.tryParse(json['longitude'].toString()) ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
