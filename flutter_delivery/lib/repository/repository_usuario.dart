import 'package:flutter_delivery/model/usuario.dart';

abstract class RepositoryUsuario{

  Future<List<Usuario>> findAllUsuarios();

}