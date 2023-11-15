class Cliente {
   int id;
   String nome;
   String email;
   String telefone;
   String endereco;
   String cep;
   String numeroCasa;

  Cliente({
    required this.id,
    required this.nome,
    required this.email,
    required this.telefone,
    required this.endereco,
    required this.cep,
    required this.numeroCasa,
  });

  factory Cliente.fromJson(Map<String, dynamic> json) {
    return Cliente(
      id: json['id'],
      nome: json['nome'],
      email: json['email'],
      telefone: json['telefone'],
      endereco: json['endereco'],
      cep: json['cep'],
      numeroCasa: json['numeroCasa'],
    );
  }
}
