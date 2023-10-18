import 'package:flutter/material.dart';

class CarrinhoPage extends StatefulWidget {
  @override
  _CarrinhoPageState createState() => _CarrinhoPageState();
}

class _CarrinhoPageState extends State<CarrinhoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEAEAEA),
        title: Text(
          'Carrinho',
          style: TextStyle(color: Colors.black), // Define a cor do texto como preto
        ),
        elevation: 0,
        leading: null,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Text('Conteúdo da página do carrinho aqui'),
      ),
    );
  }
}
