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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/lanches.png'), // Substitua 'sua_imagem.jpg' pelo caminho correto da sua imagem
            fit: BoxFit.cover, // Isso fará a imagem cobrir toda a área do Container
          ),
        ),
        child: Center(
          // Conteúdo que você deseja adicionar acima da imagem
          child: Text(
            'Conteúdo da página do carrinho aqui!!!!',
            style: TextStyle(
              color: Colors.white, // Defina a cor do texto
              fontSize: 20, // Defina o tamanho do texto
            ),
          ),
        ),
      ),

    );
  }
}
