import 'package:flutter/material.dart';

class PedidosPage extends StatefulWidget {
  @override
  _PedidosPageState createState() => _PedidosPageState();
}

class _PedidosPageState extends State<PedidosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEAEAEA),
        title: Text(
          'Pedidos',
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
