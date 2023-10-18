import 'package:flutter/material.dart';

class LojaPage extends StatefulWidget {
  @override
  _LojaPageState createState() => _LojaPageState();
}

class _LojaPageState extends State<LojaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEAEAEA),
        title: Text(
          'Loja',
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
