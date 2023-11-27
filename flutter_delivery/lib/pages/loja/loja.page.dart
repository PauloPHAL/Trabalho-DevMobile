import 'package:flutter/material.dart';
import 'package:flutter_delivery/pages/loja/produtos.pages.dart';


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
    Category(name: 'Pizza', color: const Color(0x00ffe7d7), imageUrl: 'assets/images/pizza.png', id: 2),
    Category(name: 'Lanches', color: const Color(0x00ffcead), imageUrl: 'assets/images/lanches.png', id: 1),
    Category(name: 'Comidas', color: const Color(0x00ffcead), imageUrl: 'assets/images/comida.jpg', id: 5),
    Category(name: 'Bebidas', color: const Color(0x00ffcead), imageUrl: 'assets/images/bebidas.png', id: 3),
    Category(name: 'Açaí', color: const Color(0x00ffcead), imageUrl: 'assets/images/acai.png', id: 6),
    Category(name: 'Sobremesas', color: const Color(0x00ffcead), imageUrl: 'assets/images/sobremesas.png', id: 4),
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

              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => ProdutosPage( idCategoria: category.id),
              //   ),
              // );
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


