class Produto {
  int id;
  String nome;
  double valor;
  String img;

  Produto({
    required this.id,
    required this.nome,
    required this.valor,
    required this.img,
  });

  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
      id: json['id'],
      nome: json['nome'],
      valor: double.parse(json['valor'].replaceAll(',', '.')),
      img: json['img'],
    );
  }
}
