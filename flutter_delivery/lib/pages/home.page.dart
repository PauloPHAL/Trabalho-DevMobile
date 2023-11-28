import 'package:flutter/material.dart';
import 'package:flutter_delivery/pages/user.page.dart';
import 'package:flutter_delivery/pages/loja/loja.page.dart';
import 'package:flutter_delivery/pages/pedidos.page.dart';
import 'package:flutter_delivery/pages/carinho.page.dart';
import '../model/cliente.dart';
import 'loja/produtos.pages.dart';


class HomePage extends StatefulWidget {
  Cliente cliente;

  HomePage(this.cliente);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  bool _isOpenProdutos = false;
  int _idCategoria = 0;
  void _changeSelectedIndex(int newIndex) {
    setState(() {
      _selectedIndex = newIndex;
    });
  }

  void _onCategoriaSelecionada(int newIndex, int idCategoria){
    setState(() {
      _isOpenProdutos = true;
      _idCategoria = idCategoria;
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
        indicatorColor: const Color(0xFFF27121),
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
      return LojaPage(
        onCategoriaSelecionada: (int newIndex, int idCategoria) {
          _onCategoriaSelecionada(newIndex, idCategoria);
        },
      );
    } else if (selectedIndex == 1) {
      _isOpenProdutos = false;
      return PedidosPage(widget.cliente);
    } else if (selectedIndex == 2) {
      _isOpenProdutos = false;
      return CarrinhoPage(widget.cliente);
    } else if (selectedIndex == 3) {
      _isOpenProdutos = false;
      return UserPage(
        widget.cliente
      );
    } else if (_selectedIndex == 3) {
      return UserPage(
          widget.cliente
      );
    }  else {
      return ProdutosPage(idCategoria: _idCategoria);

    }
  }
}


