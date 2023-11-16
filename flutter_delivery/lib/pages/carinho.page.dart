import 'package:flutter/material.dart';
import 'package:flutter_delivery/model/cliente.dart';
import 'package:http/http.dart' as http;
class Item {
  int idProduto;
  String nome;
  double preco;
  int quantidade;

  Item({required this.idProduto,required this.nome, required this.preco, required this.quantidade});
}

class CarrinhoPage extends StatefulWidget {
  Cliente cliente;
  CarrinhoPage(this.cliente);

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
        color: const Color(0xFFEAEAEA),
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
  static List<Item> carrinho = [];

  static void _adicionarItemAoCarrinho(Item newItem) {
      carrinho.add(newItem);
  }

  Future<void> _realizarPedido(double totalPedido, String IDs) async{
    String url = 'https://dev.levsistemas.com.br/api.flutter/pedidos';

    try {
      final response = await http.post(
        Uri.parse(url),
        body: {
          'cliente': widget.cliente.id,
          'produto': IDs,
          'vlEntrega': 'pode ser nulo ou passar algum valor separado por PONTO',
          'vlTotal': totalPedido,
          'obs': 'qialquer observacao',
        },
      );
      if (response.statusCode == 200){

      }else{

      }
    } catch (error) {
      print('Erro ao realizar pedido: $error');
    }
  }

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
              Expanded(
                child: ListView.builder(
                  itemCount: carrinho.length,
                  itemBuilder: (context, index) {
                    var item = carrinho[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 10),
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
              PedidoWidget(totalPedido: totalPedido, onPressedRealizarPedido: () {
                List<int> listaIds = [];
                for (var item in carrinho) {
                  listaIds.add(item.idProduto);
                }
                String produtosString = listaIds.join(',');

                //_realizarPedido(totalPedido,produtosString);
                print('Pedido realizado!');

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
      margin: const EdgeInsets.all(10),
      color: const Color(0xFFEAEAEA),
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
                  style: const TextStyle(fontSize: 18, color: Colors.green),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: onPressedRealizarPedido,
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
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
      onPressed: () {},
      minWidth: 0,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      color: const Color(0xFFF27121),
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






