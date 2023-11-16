import 'package:flutter/material.dart';

class Category {
  final String name;
  final Color color;
  final String imageUrl;
  final int id;
  Category({required this.name, required this.color, required this.imageUrl, required this.id});
}

class LojaPage extends StatefulWidget {
  final Function(int, int) onCategoriaSelecionada;

  LojaPage({required this.onCategoriaSelecionada});

  @override
  _LojaPageState createState() => _LojaPageState();
}

class _LojaPageState extends State<LojaPage> {
  final List<Category> categories = [
    Category(name: 'Pizza', color: const Color(0xFFE7D7), imageUrl: 'images/pizza.png', id: 1),
    Category(name: 'Lanches', color: const Color(0xFFCEAD), imageUrl: 'images/lanches.png', id: 2),
    Category(name: 'Comidas', color: const Color(0xFFCEAD), imageUrl: 'images/comida.jpg', id: 3),
    Category(name: 'Bebidas', color: const Color(0xFFCEAD), imageUrl: 'images/bebidas.png', id: 4),
    Category(name: 'Açaí', color: const Color(0xFFCEAD), imageUrl: 'images/acai.png', id: 5),
    Category(name: 'Sobremesas', color: const Color(0xFFCEAD), imageUrl: 'images/sobremesas.png', id: 6),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFEAEAEA),
        title: const Text(
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
              widget.onCategoriaSelecionada(4, category.id);
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(
              category.imageUrl,
              width: 100.0,
              height: 100.0,
            ),
            const SizedBox(height: 8.0),
            Text(
              category.name,
              style: const TextStyle(color: Colors.black, fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}


