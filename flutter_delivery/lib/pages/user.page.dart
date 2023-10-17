import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  final String name;
  final String email;
  final String address;
  final String cep;
  final String number;

  UserPage(this.name, this.email, this.address, this.cep, this.number);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        ),
      ),
    );
  }
}
