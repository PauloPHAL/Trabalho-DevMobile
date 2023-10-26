import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

class Produto {
   int id;
   String nome;
   double valor;
   Uint8List img;

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
      img: _decodeImage(json['img']),
    );
  }

  static Uint8List _decodeImage(String base64String) {
    List<int> bytes = base64.decode(base64String);
    return Uint8List.fromList(bytes);
  }
}
