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

  // Future<List<Pedido>> getPedidos() async {
  //  ERRO
  //
  //   var url = Uri.parse('https://dev.levsistemas.com.br/api.flutter/pedidos');
  //
  //   var response = await http.get(url);
  //
  //
  //   if (response.statusCode == 200) {
  //     List<dynamic> jsonData = jsonDecode(utf8.decode(response.bodyBytes));
  //     List<Pedido> pedidos = jsonData.map((json) => Pedido.fromJson(json)).toList();
  //     return pedidos;
  //   } else {
  //     throw Exception('Erro ao carregar pedidos');
  //   }
  // }

  Future<List<Teste>> getTeste() async{
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await http.get(url);

    if (response.statusCode == 200) {
          List<dynamic> jsonData = jsonDecode(utf8.decode(response.bodyBytes));
          List<Teste> teste = jsonData.map((json) => Teste.fromJson(json)).toList();
          return teste;
        } else {
          throw Exception('Erro ao carregar pedidos');
        }

  }


  // Future<List> getPedidos() async{
  //   var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
  //   //var url = Uri.parse('https://dev.levsistemas.com.br/api.flutter/pedidos');
  //   var response = await http.get(url);
  //
  //   if(response.statusCode == 200){
  //     return jsonDecode(utf8.decode(response.bodyBytes));
  //   }else{
  //     throw Exception('erro ao carregar pedidos');
  //   }
  // }

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
      // body: Center(
      //   child: Text('Conteúdo da página do carrinho aqui'),
      // ),
      body: FutureBuilder<List<Teste>>(
        future: getTeste(),
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
                Teste teste = snapshot.data![index];

                return ListTile(
                  title: Text(teste.title),
                );
              },
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),


      // body: FutureBuilder<List>(
      //   future: getPedidos(),
      //   builder: (context,snapshot){
      //     if(snapshot.hasError){
      //       //print('oiiiiiiiiiiiiiiiiiiiii');
      //       //print(snapshot.hasError);
      //       return const Center(
      //         child: Text('Erro ao carregar pedidos!'),
      //       );
      //     }
      //
      //     if(snapshot.hasData){
      //       return ListView.builder(
      //         itemCount: snapshot.data!.length,
      //         itemBuilder: (context, index){
      //           return ListTile(
      //             //title: Text(snapshot.data![index]['title']),
      //             title: Text(snapshot.data![index]['produto']),
      //           );
      //         },
      //       );
      //     }
      //     return const Center(
      //       child: CircularProgressIndicator(),
      //     );
      //   },
      // ),

    );
  }
}
