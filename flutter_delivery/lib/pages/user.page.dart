import 'package:flutter/material.dart';


class UserPage extends StatefulWidget {
  final String name;
  final String email;
  final String address;
  final String cep;
  final String number;

  UserPage(this.name, this.email, this.address, this.cep, this.number);

  //
  // final Welcome? usuario;
  //
  // UserPage(this.usuario);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEAEAEA),
        title: const Text(
          'Minha Conta',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          Theme(
            data: ThemeData(iconTheme: IconThemeData(color: Colors.black)),
            child: IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                // Adicione a lógica para sair da conta aqui
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Nome: ${widget.name}'),
            SizedBox(height: 16.0),
            Text('Email: ${widget.email}'),
            SizedBox(height: 16.0),
            Text('Endereço: ${widget.address}'),
            SizedBox(height: 16.0),
            Text('CEP: ${widget.cep}'),
            SizedBox(height: 16.0),
            Text('Número: ${widget.number}'),
          ],
          // children: <Widget>[
          //   Text('Nome: ${widget.usuario?.message}'),
          //   SizedBox(height: 16.0),
          //   Text('Email: ${widget.usuario?.data.first.nome}'),
          //   SizedBox(height: 16.0),
          //   Text('Endereço: n tem'),
          //   SizedBox(height: 16.0),
          //   Text('CEP: n tem'),
          //   SizedBox(height: 16.0),
          //   Text('Número: 22223 <nao veio do json - n sabia q tinha kkkk>'),
          // ],
        ),
      ),
    );
  }
}
