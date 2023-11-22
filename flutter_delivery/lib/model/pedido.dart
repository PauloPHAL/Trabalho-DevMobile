class Pedido {
   int id;
   String cliente;
   List<String> produto;
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

   factory Pedido.fromJson(Map<String, dynamic> map) {
     List<String> produtos = [];
     if (map['produto'] != null) {
       for (var produto in map['produto']) {
         produtos.add(produto.toString());
       }
     }

     return Pedido(
       id: map['id'],
       cliente: map['cliente'],
       produto: produtos,
       valorTotal: double.parse(map['vl_total'].replaceAll(',', '.')),
       valorEntrega: double.parse(map['vl_entrega'].replaceAll(',', '.')),
       retirada: map['retirada'].toString().toLowerCase() == 'não' ? false : true,
       status: map['status'],
       observacao: map['obs'],
     );
   }
}
