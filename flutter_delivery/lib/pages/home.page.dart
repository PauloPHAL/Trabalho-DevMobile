import 'package:flutter/material.dart';
import 'package:flutter_delivery/pages/user.page.dart';
import 'package:flutter_delivery/pages/loja/loja.page.dart';
import 'package:flutter_delivery/pages/pedidos.page.dart';
import 'package:flutter_delivery/pages/carinho.page.dart';

import 'loja/produtos.pages.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Índice da aba selecionada na parte inferior
  bool _isOpenProdutos = false;
  void _changeSelectedIndex(int newIndex) {
    setState(() {
      _selectedIndex = newIndex;
    });
  }

  void _onCategoriaSelecionada(int newIndex){
    setState(() {
      _isOpenProdutos = true;
      _buildBody(newIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(_selectedIndex),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          _changeSelectedIndex(index);
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

  Widget _buildBody(selectedIndex) {
    if (selectedIndex == 0 && !_isOpenProdutos) {
      print('Loja');
      // Se a aba "Loja" estiver selecionada, exiba a página da loja
      return LojaPage(
        onCategoriaSelecionada: (int newIndex) {
          _onCategoriaSelecionada(newIndex);
        },
      );
    } else if (selectedIndex == 1) {
      _isOpenProdutos = false;
      // Se a aba "Pedidos" estiver selecionada, exiba a página de pedidos
      return PedidosPage();
    } else if (selectedIndex == 2) {
      _isOpenProdutos = false;
      // Se a aba "Carrinho" estiver selecionada, exiba a página do carrinho
      return CarrinhoPage();
    } else if (selectedIndex == 3) {
      _isOpenProdutos = false;
      // Use a lista de usuários aqui.
      return UserPage(
        "Fulano",
        "fulano.alves@gmail.com",
        "Rua: Avenida Paulista. App: 406",
        "12564-200",
        "8",
        "(11) 98468-1562",
      );
    } else if (_selectedIndex == 3) {
      // Use a lista de usuários aqui.
      return UserPage(
        "Fulano",
        "fulano.alves@gmail.com",
        "Rua: Avenida Paulista. App: 406",
        "12564-200",
        "8",
        "(11) 98468-1562",
      );
    }  else {
      return ProdutosPage();
    }

  }
}


