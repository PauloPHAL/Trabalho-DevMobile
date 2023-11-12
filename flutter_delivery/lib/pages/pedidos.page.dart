import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/pedido.dart';

class PedidosPage extends StatefulWidget {
  @override
  _PedidosPageState createState() => _PedidosPageState();
}

class _PedidosPageState extends State<PedidosPage> {

  Future<List<Pedido>> getPedidos() async {
    var url = Uri.parse('https://dev.levsistemas.com.br/api.flutter/pedidos');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(utf8.decode(response.bodyBytes));
      List<Pedido> produto = jsonData.map((json) => Pedido.fromJson(json)).toList();
      return produto;
    } else {
      throw Exception('Erro ao carregar pedidos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFEAEAEA),
        title: const Text(
          'Pedidos',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        leading: null,
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder<List<Pedido>>(
        future: getPedidos(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Erro ao carregar Pedidos!'),
            );
          }
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Pedido product = snapshot.data![index];
                return PedidoItemWidget(pedido: product);
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class PedidoItemWidget extends StatelessWidget {
  final Pedido pedido;

  PedidoItemWidget({required this.pedido});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0.0, left: 16.0, right: 16.0, bottom: 10.0), // Padding entre os elementos
      child: Container(
        // Novo Container aninhado
        color: const Color(0xFFEAEAEA),
        child: ListTile(
          title: Text('Status: ${pedido.status}'),
          subtitle: Text('Produtos: ${pedido.produto} \nTotal: \$${pedido.valorTotal.toStringAsFixed(2)}'),
        ),
      ),
    );
  }
}


