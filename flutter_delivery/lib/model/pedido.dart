
import 'package:flutter_delivery/model/produto.dart';
import 'package:flutter_delivery/model/status.dart';
import 'package:flutter_delivery/model/usuario.dart';

class Pedido{

  String idPedido;
  Usuario cliente;
  double total;
  Status status;
  DateTime data;
  String endereco;
  bool isRetirarNaLoja;
  List<Produto> produtos;
  double taxaEntrega;

  Pedido(this.idPedido, this.cliente, this.total, this.status, this.data,
      this.endereco, this.isRetirarNaLoja, this.produtos, this.taxaEntrega);
}