class Categoria {
   int id;
   String nome;

  Categoria({
    required this.id,
    required this.nome,
  });

  factory Categoria.fromJson(Map<String, dynamic> json) {
    return Categoria(
      id: json['id'],
      nome: json['nome'],
    );
  }
}
