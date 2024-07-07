import 'dart:convert';

List<Recompensa> welcomeFromJson(String str) => List<Recompensa>.from(json.decode(str).map((x) => Recompensa.fromJson(x)));

String welcomeToJson(List<Recompensa> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Recompensa {
  int id;
  String titulo;
  String descricao;

  Recompensa({
    required this.id,
    required this.titulo,
    required this.descricao,
  });

  factory Recompensa.fromJson(Map<String, dynamic> json) => Recompensa(
    id: json["id"],
    titulo: json["titulo"],
    descricao: json["descricao"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "titulo": titulo,
    "descricao": descricao,
  };
}
