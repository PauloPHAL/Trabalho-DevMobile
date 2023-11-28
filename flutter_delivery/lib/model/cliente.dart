import 'dart:convert';
import '../util/prefs.dart';

class Cliente{
  int? id;
  String? nome;
  String? email;
  String? telefone;
  String? endereco;
  String? cep;
  String? numeroCasa;
  String? img;

  Cliente({
     this.id,
     this.nome,
     this.email,
     this.telefone,
     this.endereco,
     this.cep,
     this.numeroCasa,
     this.img
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
      //img: json['img'],
    );
  }

  @override
  String toString() {
    return 'Usuario{id: $id, nome: $nome, email: $email, telefone: $telefone, endereco: $endereco, cep: $cep, numeroCasa: $numeroCasa, img: $img}';
  }

  Cliente.fromMap(Map<String, dynamic> map){
    id = map["id"];
    nome = map["nome"];
    email = map["email"];
    telefone = map["telefone"];
    endereco = map["endereco"];
    cep = map["cep"];
    numeroCasa = map["numeroCasa"];
    img = map["img"];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nome'] = nome;
    data['email'] = email;
    data['telefone'] = telefone;
    data['endereco'] = endereco;
    data['cep'] = cep;
    data['numeroCasa'] = numeroCasa;
    data['img'] = img;
    return data;
  }

  static void limpar() {
    Prefs.setString("user.prefs", "");
  }

  void salvar() {
    Map usuario_map = toMap();
    String usuario_string = json.encode(usuario_map);
    Prefs.setString("user.prefs", usuario_string);
  }

  static Future<Cliente?> obter() async {
    String usuario_string = await Prefs.getString("user.prefs");
    if (usuario_string.isEmpty) {
      return null;
    }
    Map<String, dynamic> usuario_map = json.decode(usuario_string);
    Cliente usuario = Cliente.fromMap(usuario_map);
    return usuario;
  }
}
