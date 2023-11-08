class Status {
   int id;
   String nome;

  Status({
    required this.id,
    required this.nome,
  });

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      id: json['id'],
      nome: json['nome'],
    );
  }
}
