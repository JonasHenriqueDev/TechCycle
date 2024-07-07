

class Anuncio {
  String titulo;
  String descricao;
  String imageUrl;
  double preco;

  Anuncio({
    required this.titulo,
    required this.descricao,
    required this.imageUrl,
    required this.preco
  });

  factory Anuncio.fromJson(Map<String, dynamic> json) {
    return Anuncio(
      titulo: json['titulo'],
      descricao: json['descricao'],
      preco: json['preco'],
      imageUrl: json['imageUrl'] ?? 'assets/images/tvplaceholder.png', // Definindo o placeholder local
    );
  }
}
