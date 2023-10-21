import 'dart:convert';

import 'package:flutter_delivery/model/usuario.dart';
import 'package:flutter_delivery/repository/repository_usuario.dart';
import 'package:http/http.dart' as http;

class HttpUsuario implements RepositoryUsuario{

  @override
  Future<List<Usuario>> findAllUsuarios() async {
    var url = Uri.https('5f7cba02834b5c0016b058aa.mockapi.io', '/api/users');
    final response = await http.get(url);
    final List<dynamic> responseMap = jsonDecode(response.body);
    return responseMap.map<Usuario>((resp) => Usuario.fromMap(resp)).toList();
  }


}