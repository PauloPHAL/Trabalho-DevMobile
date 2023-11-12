import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../model/produto.dart';


class ProdutosPage extends StatefulWidget {
  final int idCategoria;

  ProdutosPage({required this.idCategoria});

  @override
  _ProdutosPageState createState() => _ProdutosPageState();
}

class _ProdutosPageState extends State<ProdutosPage> {
  Future<List<Produto>> getProduto() async {
    var url = Uri.parse('https://dev.levsistemas.com.br/api.flutter/produtos?idCategoria=${widget.idCategoria}');
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
        backgroundColor: const Color(0xFFEAEAEA),
        title: const Text(
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
    return GestureDetector(
      onTap: () {
        // Mostrar a tela Carinho ao clicar no item
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Carinho(product: product);
          },
        );
      },
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTEmEqpk_DwGaE0CePAB96Oa41otmdkfxWZqUVGu_QjfWPMJblmE91Q05AddaP5GqhqZjU&usqp=CAU',
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              product.nome,
              style: const TextStyle(color: Colors.black, fontSize: 18.0),
            ),
            Text(
              '\$${product.valor.toStringAsFixed(2)}',
              style: const TextStyle(color: Colors.black, fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}

class Carinho extends StatefulWidget {
  final Produto product;

  Carinho({required this.product});

  @override
  _CarinhoState createState() => _CarinhoState();
}

class _CarinhoState extends State<Carinho> {
  int quantidade = 1;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        color: const Color(0xFFF27121),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8.0),
            Text(
              'Preço: \$${widget.product.valor.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 16.0, color: Colors.white),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Quantidade:',
              style: TextStyle(fontSize: 16.0, color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (quantidade > 1) {
                        quantidade--;
                      }
                    });
                  },
                  icon: const Icon(Icons.remove, color: Colors.white),
                ),
                Text(
                  quantidade.toString(),
                  style: const TextStyle(fontSize: 16.0, color: Colors.white),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      quantidade++;
                    });
                  },
                  icon: const Icon(Icons.add, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            ElevatedButton.icon(
              onPressed: () {
                // Adicione aqui a lógica para adicionar ao carrinho com a quantidade selecionada
                Navigator.pop(context);
              },
              icon: const Icon(Icons.add_shopping_cart),
              label: const Text('Adicionar ao carrinho'),
            ),
          ],
        ),
      ),
    );
  }
}