class Pedido {
   int id;
   String cliente;
   String produto;
   double valorTotal;
   double valorEntrega;
   bool retirada;
   String status;
   String observacao;

  Pedido({
    required this.id,
    required this.cliente,
    required this.produto,
    required this.valorTotal,
    required this.valorEntrega,
    required this.retirada,
    required this.status,
    required this.observacao,
  });

  factory Pedido.fromJson(Map<String, dynamic> json) {
    return Pedido(
      id: json['id'],
      cliente: json['cliente'],
      produto: json['produto'],
      valorTotal: double.parse(json['vl_total'].replaceAll(',', '.')),
      valorEntrega: double.parse(json['vl_entrega'].replaceAll(',', '.')),
      retirada: json['retirada'].toLowerCase() == 'não' ? false : true,
      status: json['status'],
      observacao: json['obs'],
    );
  }
}
