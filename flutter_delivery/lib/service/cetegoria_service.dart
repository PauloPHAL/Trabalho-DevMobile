import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List> getPedidos() async{
  var url = Uri.parse('https://dev.levsistemas.com.br/api.flutter/pedidos');

  var response = await http.get(url);

  if(response.statusCode == 200){
    return jsonDecode(utf8.decode(response.bodyBytes));
  }else{
    throw Exception('erro ao carregar pedidos');
  }
}