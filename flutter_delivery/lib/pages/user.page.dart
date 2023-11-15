import 'package:flutter/material.dart';

import '../model/cliente.dart';

class UserPage extends StatefulWidget {
   Cliente cliente;

  UserPage(this.cliente);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cepController = TextEditingController();
  TextEditingController numeroController = TextEditingController();

  void _salvarAlteracoes(){}
  @override
  void initState() {
    super.initState();
    emailController.text = widget.cliente.email;
    phoneController.text = widget.cliente.telefone;
    addressController.text = widget.cliente.endereco;
    cepController.text = widget.cliente.cep;
    numeroController.text = widget.cliente.numeroCasa;
    // Adicione inicializações para outros controladores, se necessário
  }

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            color: Color(0xFFF27121),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.account_circle,
                  size: 96.0,
                ),
                Text(
                  '${widget.cliente.nome}',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.0),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    labelText: 'Telefone',
                  ),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: addressController,
                  decoration: InputDecoration(
                    labelText: 'Endereço',
                  ),
                ),
                TextFormField(
                  controller: cepController,
                  decoration: InputDecoration(
                    labelText: 'CEP',
                  ),
                ),
                TextFormField(
                  controller: numeroController,
                  decoration: InputDecoration(
                    labelText: 'Número',
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // Adicione a lógica para salvar as alterações aqui
                    // Pode acessar os valores dos controladores (emailController.text, phoneController.text, addressController.text)
                    _salvarAlteracoes();
                  },
                  child: Text('Salvar Alterações'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
