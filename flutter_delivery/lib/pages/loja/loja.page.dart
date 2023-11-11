import 'package:flutter/material.dart';
import 'package:flutter_delivery/pages/loja/produtos.pages.dart';

class Category {
  final String name;
  final Color color;
  final String imageUrl;

  Category({required this.name, required this.color, required this.imageUrl});
}

class LojaPage extends StatefulWidget {
  final Function(int) onCategoriaSelecionada;

  LojaPage({required this.onCategoriaSelecionada});

  @override
  _LojaPageState createState() => _LojaPageState();
}

class _LojaPageState extends State<LojaPage> {
  final List<Category> categories = [
    Category(name: 'Pizza', color: Color(0xFFE7D7), imageUrl: 'images/pizza.png'),
    Category(name: 'Lanches', color: Color(0xFFCEAD), imageUrl: 'images/lanches.png'),
    Category(name: 'Comidas', color: Color(0xFFCEAD), imageUrl: 'images/comida.jpg'),
    Category(name: 'Bebidas', color: Color(0xFFCEAD), imageUrl: 'images/bebidas.png'),
    Category(name: 'Açaí', color: Color(0xFFCEAD), imageUrl: 'images/acai.png'),
    Category(name: 'Sobremesas', color: Color(0xFFCEAD), imageUrl: 'images/sobremesas.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEAEAEA),
        title: Text(
          'Loja',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        leading: null,
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return InkWell(
            onTap: () {
              widget.onCategoriaSelecionada(4);
            },
            child: CategoryItem(category: category),
          );
        },
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final Category category;

  CategoryItem({required this.category});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        color: category.color,
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(
              category.imageUrl, // Use Image.asset para carregar uma imagem de recursos locais
              width: 100.0, // Defina a largura desejada
              height: 100.0, // Defina a altura desejada
            ),
            SizedBox(height: 8.0),
            Text(
              category.name,
              style: TextStyle(color: Colors.black, fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}


