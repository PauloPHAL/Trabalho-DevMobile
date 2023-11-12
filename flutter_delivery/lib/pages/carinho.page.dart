import 'package:flutter/material.dart';

class Item {
  String nome;
  double preco;
  int quantidade;

  Item({required this.nome, required this.preco, required this.quantidade});
}

class CarrinhoPage extends StatefulWidget {
  @override
  _CarrinhoPageState createState() => _CarrinhoPageState();

  static void adicionarItemAoCarrinho(Item newItem) {
    _CarrinhoPageState._adicionarItemAoCarrinho(newItem);
  }
}

class ItemPage extends StatefulWidget {
  final Item item;
  final Function() onIncrement;
  final Function() onDecrement;

  ItemPage({
    required this.item,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        color: const Color(0xFFEAEAEA), // Cor de fundo cinza
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.item.nome,
                style: const TextStyle(fontSize: 16),
              ),
              BotaoQuantidade(
                quantidade: widget.item.quantidade,
                onIncrement: widget.onIncrement,
                onDecrement: widget.onDecrement,
              ),
            ],
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '',
                style: TextStyle(fontSize: 14),
              ),
              Text(
                '\$${widget.item.preco * widget.item.quantidade}',
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CarrinhoPageState extends State<CarrinhoPage> {
  static List<Item> carrinho = [
    Item(nome: 'Hamburguer', preco: 10.0, quantidade: 2),
    Item(nome: 'Batata Frita', preco: 5.0, quantidade: 1),
    Item(nome: 'Refrigerante', preco: 2.5, quantidade: 3),
  ];

  static void _adicionarItemAoCarrinho(Item newItem) {

      carrinho.add(newItem);

  }

  // Lista para armazenar os itens selecionados
  List<bool> itemSelecionado = List.generate(3, (index) => false);

  @override
  Widget build(BuildContext context) {
    double totalPedido = calcularTotalPedido();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFEAEAEA),
        title: const Text(
          'Carrinho',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        leading: null,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              const Text(
                '',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              // Lista de itens no carrinho com botões de mais e menos
              Expanded(
                child: ListView.builder(
                  itemCount: carrinho.length,
                  itemBuilder: (context, index) {
                    var item = carrinho[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 10), // Espaçamento inferior entre os itens
                      child: ItemPage(
                        item: item,
                        onIncrement: () {
                          setState(() {
                            item.quantidade += 1;
                          });
                        },
                        onDecrement: () {
                          setState(() {
                            if (item.quantidade > 0) {
                              item.quantidade -= 1;
                            }
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
              // Utiliza a classe PedidoWidget para mostrar o total do pedido e o botão "Realizar Pedido"
              PedidoWidget(totalPedido: totalPedido, onPressedRealizarPedido: () {
                // Lógica para processar itens selecionados
                List<Item> itensSelecionados = [];
                for (int i = 0; i < carrinho.length; i++) {
                  if (itemSelecionado[i]) {
                    itensSelecionados.add(carrinho[i]);
                  }
                }

                // Lógica para realizar o pedido com os itens selecionados
                print('Pedido realizado! Itens selecionados: $itensSelecionados');
              }),
            ],
          ),
        ),
      ),
    );
  }

  double calcularTotalPedido() {
    double total = 0;
    for (var item in carrinho) {
      total += item.preco * item.quantidade;
    }
    return total;
  }
}

class PedidoWidget extends StatelessWidget {
  final double totalPedido;
  final VoidCallback onPressedRealizarPedido;

  PedidoWidget({required this.totalPedido, required this.onPressedRealizarPedido});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10), // Adiciona margem ao redor do PedidoWidget
      color: const Color(0xFFEAEAEA), // Define a cor de fundo
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total do Pedido:',
                  style: TextStyle(fontSize: 18, color: Colors.red),
                ),
                Text(
                  '\$$totalPedido',
                  style: const TextStyle(fontSize: 18, color: Colors.green), // Muda a cor do preço para verde
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: onPressedRealizarPedido,
            style: ElevatedButton.styleFrom(
              primary: Colors.red, // Cor de fundo do botão
              padding: const EdgeInsets.symmetric(horizontal: 10),
            ),
            child: const Text('Realizar Pedido'),
          ),
          const Text(
            '',
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}

class BotaoQuantidade extends StatelessWidget {
  final int quantidade;
  final Function() onIncrement;
  final Function() onDecrement;

  BotaoQuantidade({required this.quantidade, required this.onIncrement, required this.onDecrement});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {}, // Adicionado um onPressed vazio para permitir toques no botão
      minWidth: 0, // Define a largura mínima para ocupar apenas o espaço necessário
      padding: const EdgeInsets.symmetric(horizontal: 8), // Ajuste o espaçamento conforme necessário
      color: const Color(0xFFF27121), // Cor de fundo do botão
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: onDecrement,
            icon: const Icon(Icons.remove),
          ),
          Text(
            quantidade.toString(),
            style: const TextStyle(fontSize: 16),
          ),
          IconButton(
            onPressed: onIncrement,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}






