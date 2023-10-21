import 'package:flutter/material.dart';

class Product {
  final String name;
  final double price;
  final String imageUrl;

  Product({required this.name, required this.price, required this.imageUrl});
}

class ProdutosPage extends StatefulWidget {
  @override
  _ProdutosPageState createState() => _ProdutosPageState();
}

class _ProdutosPageState extends State<ProdutosPage> {
  final List<Product> products = [
    Product(name: 'Pizza Margherita', price: 10.99, imageUrl: 'images/pizza_margherita.png'),
    Product(name: 'Hambúrguer Clássico', price: 8.99, imageUrl: 'images/hamburguer.png'),
    Product(name: 'Lasanha Bolonhesa', price: 12.99, imageUrl: 'images/lasanha.png'),
    Product(name: 'Refrigerante', price: 2.99, imageUrl: 'images/refrigerante.png'),
    Product(name: 'Açaí com Frutas', price: 6.99, imageUrl: 'images/acai_com_frutas.png'),
    Product(name: 'Sorvete de Chocolate', price: 4.99, imageUrl: 'images/sorvete.png'),
  ];

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
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductItem(product: product);
        },
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Image.asset(
            product.imageUrl, // Use Image.asset to load an image from local resources
            width: 100.0, // Set the desired width
            height: 100.0, // Set the desired height
          ),
          SizedBox(height: 8.0),
          Text(
            product.name,
            style: TextStyle(color: Colors.black, fontSize: 18.0),
          ),
          Text(
            '\$${product.price.toStringAsFixed(2)}', // Display price with 2 decimal places
            style: TextStyle(color: Colors.black, fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
