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

  void _changeSelectedIndex(int newIndex) {
    setState(() {
      print(newIndex); // Mensagem que será exibida no terminal
      _buildBody(newIndex);
    });
  }

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
      return LojaPage(
        onCategoriaSelecionada: (int newIndex) {
          _changeSelectedIndex(newIndex);
        },
      );
    } else if (selectedIndex == 1) {
      // Se a aba "Pedidos" estiver selecionada, exiba a página de pedidos
      return ProdutosPage();
    } else if (selectedIndex == 2) {
      // Se a aba "Carrinho" estiver selecionada, exiba a página do carrinho
      return CarrinhoPage();
    } else if (selectedIndex == 3) {
        //Use a lista de usuários aqui.
        return UserPage(
          "Fulano",
          "fulano.alves@gmail.com",
          "Endereço",
          "12564-200",
          "8"
        );
    } else if (selectedIndex == 4) {
      //Use a lista de usuários aqui.
      print('Selectec'); // Mensagem que será exibida no terminal
      print(selectedIndex); // Mensagem que será exibida no terminal
      return ProdutosPage();
    } else{
      return Text('');
    }
  }



}

