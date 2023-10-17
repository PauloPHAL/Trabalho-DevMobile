import 'package:flutter/material.dart';
import 'package:flutter_delivery/pages/user.page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 2; // Índice da aba selecionada na parte inferior

  void _onItemTapped(int index) {
    setState(() {
      // Define o índice da aba selecionada
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF8A2387),
                Color(0xFFEA1D2C),
                Color(0xFFF27121),
              ],
            ),
          ),
        ),
      ),
      body: _buildBody(_selectedIndex),
      bottomNavigationBar: DefaultTextStyle(
        style: TextStyle(color: Colors.black),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.store, color: Colors.black),
              label: 'Loja',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart, color: Colors.black),
              label: 'Carrinho',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment, color: Colors.black),
              label: 'Pedidos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.black),
              label: 'Conta',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Color(0xFFE94057),
          unselectedItemColor: Colors.black,
        ),
      ),
    );
  }

  Widget _buildBody(int selectedIndex) {
    if (selectedIndex == 3) {
      // Se a aba "Conta" estiver selecionada, exiba os detalhes do usuário
      return UserPage("Fulano",
        "fulano.alves@gmail.com",
        "Endereço",
        "12564-200",
         "8",
      );
    } else {
      // Caso contrário, exiba outro conteúdo na página
      return Center(
        child: Text('Bem-vindo à tela inicial!'),
      );
    }
  }
}

