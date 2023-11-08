import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../model/produto.dart';


class ProdutosPage extends StatefulWidget {
  @override
  _ProdutosPageState createState() => _ProdutosPageState();
}

class _ProdutosPageState extends State<ProdutosPage> {
  Future<List<Produto>> getProduto() async {
    var url = Uri.parse('https://dev.levsistemas.com.br/api.flutter/produtos');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(utf8.decode(response.bodyBytes));
      List<Produto> produto = jsonData.map((json) => Produto.fromJson(json)).toList();
      return produto;
    } else {
      throw Exception('Erro ao carregar produtos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEAEAEA),
        title: Text(
          'Produtos',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        leading: null,
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder<List<Produto>>(
        future: getProduto(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Erro ao carregar Produtos!'),
            );
          }

          if (snapshot.hasData) {
            // return ListView.builder(
            //   itemCount: snapshot.data!.length,
            //   itemBuilder: (context, index) {
            //     Produto produto = snapshot.data![index];
            //
            //     return ListTile(
            //       title: Text(produto.),
            //     );
            //   },
            // );
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Produto product = snapshot.data![index];
                return ProductItem(product: product);
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

class ProductItem extends StatelessWidget {
  final Produto product;

  ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Image.asset(
            product.img as String, // Use Image.asset to load an image from local resources
            width: 100.0, // Set the desired width
            height: 100.0, // Set the desired height
          ),
          SizedBox(height: 8.0),
          Text(
            product.nome,
            style: TextStyle(color: Colors.black, fontSize: 18.0),
          ),
          Text(
            '\$${product.valor.toStringAsFixed(2)}', // Display price with 2 decimal places
            style: TextStyle(color: Colors.black, fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
