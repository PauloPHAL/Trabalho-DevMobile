import 'package:flutter/material.dart';
import 'package:flutter_delivery/model/teste.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/pedido.dart';

class PedidoItem {
  final String status;
  final String produtos;
  final double precoTotal;

  PedidoItem({required this.status, required this.produtos, required this.precoTotal});

  factory PedidoItem.fromJson(Map<String, dynamic> json) {
    return PedidoItem(
      status: json['status'],
      produtos: json['produtos'],
      precoTotal: json['precoTotal'].toDouble(),
    );
  }
}

class PedidosPage extends StatefulWidget {
  @override
  _PedidosPageState createState() => _PedidosPageState();
}

class _PedidosPageState extends State<PedidosPage> {
  // Lista estática para simular dados de pedidos
  List<PedidoItem> pedidos = [
    PedidoItem(
      status: 'Entregue',
      produtos: 'Produto A (2x), Produto B (1x)',
      precoTotal: 50.00,
    ),
    PedidoItem(
      status: 'Em processamento',
      produtos: 'Produto C (3x)',
      precoTotal: 30.00,
    ),
    // Adicione mais pedidos conforme necessário
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEAEAEA),
        title: const Text(
          'Pedidos',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        leading: null,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          SizedBox(height: 10.0), // Espaço branco acima do ListView
          Expanded(
            child: ListView.builder(
              itemCount: pedidos.length,
              itemBuilder: (context, index) {
                PedidoItem pedido = pedidos[index];
                return PedidoItemWidget(pedido: pedido);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PedidoItemWidget extends StatelessWidget {
  final PedidoItem pedido;

  PedidoItemWidget({required this.pedido});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 0.0, left: 16.0, right: 16.0, bottom: 10.0), // Padding entre os elementos
      child: Container(
        // Novo Container aninhado
        color: Color(0xFFEAEAEA),
        child: ListTile(
          title: Text('Status: ${pedido.status}'),
          subtitle: Text('Produtos: ${pedido.produtos} \nTotal: \$${pedido.precoTotal.toStringAsFixed(2)}'),
        ),
      ),
    );
  }
}


