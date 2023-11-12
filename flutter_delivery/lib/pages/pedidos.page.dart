import 'package:flutter/material.dart';
import 'package:flutter_delivery/model/teste.dart';
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
      List<Pedido> pedidos = jsonData.map((json) => Pedido.fromJson(json)).toList();
      return pedidos;
    } else {
      throw Exception('Erro ao carregar pedidos');
    }
  }

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
      body: FutureBuilder<List<Pedido>>(
        future: getPedidos(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Erro ao carregar Teste!'),
            );
          }

          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Pedido pedido = snapshot.data![index];

                return ListTile(
                  title: Text(pedido.produto),
                );
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
