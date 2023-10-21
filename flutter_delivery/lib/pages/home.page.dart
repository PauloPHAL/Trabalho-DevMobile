import 'package:flutter/material.dart';
import 'package:flutter_delivery/pages/user.page.dart';
import 'package:flutter_delivery/pages/loja/loja.page.dart';
import 'package:flutter_delivery/pages/pedidos.page.dart';
import 'package:flutter_delivery/pages/carinho.page.dart';

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
      body: _buildBody(_selectedIndex),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        indicatorColor: Color(0xFFF27121),
        selectedIndex: _selectedIndex,
        destinations: const <NavigationDestination>[
          NavigationDestination(
            selectedIcon: Icon(Icons.store),
            icon: Icon(Icons.store_outlined),
            label: 'Loja',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.assignment),
            icon: Icon(Icons.assignment_outlined),
            label: 'Pedidos',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.shopping_cart),
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Carrinho',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.person_outline),
            label: 'Conta',
          ),
        ],
      ),

    );
  }

  Widget _buildBody(int selectedIndex) {
    if (selectedIndex == 0) {
      // Se a aba "Loja" estiver selecionada, exiba a página da loja
      return LojaPage();
    } else if (selectedIndex == 1) {
      // Se a aba "Pedidos" estiver selecionada, exiba a página de pedidos
      return PedidosPage();
    } else if (selectedIndex == 2) {
      // Se a aba "Carrinho" estiver selecionada, exiba a página do carrinho
      return CarrinhoPage();
    } else if (selectedIndex == 3) {
      // Se a aba "Minha Conta" estiver selecionada, exiba a página de conta do usuário
      return UserPage(
        "Fulano",
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

