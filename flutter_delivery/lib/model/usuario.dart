import 'dart:convert';

import 'package:flutter_delivery/model/pedido.dart';

class Usuario{

  String idUsuario;
  String nomeUsuario;
  String endereco;
  String cep;
  bool isCliente;
  String email;
  String senha;
  String cidade;
  String cpf;
  //DescontoStrategy? descontoStrategy;
  //List<Pedido> pedidos;

  Usuario(
      this.idUsuario,
      this.nomeUsuario,
      this.endereco,
      this.cep,
      this.isCliente,
      this.email,
      this.senha,
      this.cidade,
      this.cpf,
      //this.pedidos
  );

  Map<String, dynamic> toMap() {
    return {
      'idUsuario': idUsuario,
      'nomeUsuario': nomeUsuario,
      'endereco': endereco,
      'cep': cep,
      'isCliente': isCliente,
      'email': email,
      'senha': senha,
      'cidade': cidade,
      'cpf': cpf,
    };
  }

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      map['idUsuario'] ?? '',
      map['nomeUsuario'] ?? '',
      map['endereco'] ?? '',
      map['cep'] ?? '',
      map['isCliente'] ?? false,
      map['email'] ?? '',
      map['senha'] ?? '',
      map['cidade'] ?? '',
      map['cpf'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Usuario.fromJson(String source) => Usuario.fromMap(json.decode(source));

}