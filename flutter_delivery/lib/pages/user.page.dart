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

  @override
  void initState() {
    super.initState();
    emailController.text = widget.cliente.email;
    phoneController.text = widget.cliente.telefone;
    addressController.text = widget.cliente.endereco;
    cepController.text = widget.cliente.cep;
    numeroController.text = widget.cliente.numeroCasa;
  }
  //
  // void _salvarAlteracoes(){
  //
  // }

  void _sairApp(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFEAEAEA),
        title: const Text(
          'Minha Conta',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          Theme(
            data: ThemeData(iconTheme: const IconThemeData(color: Colors.black)),
            child: IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                _sairApp();
              },
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            color: const Color(0xFFF27121),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.account_circle,
                  size: 96.0,
                ),
                Text(
                  widget.cliente.nome,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: phoneController,
                  decoration: const InputDecoration(
                    labelText: 'Telefone',
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: addressController,
                  decoration: const InputDecoration(
                    labelText: 'Endereço',
                  ),
                ),
                TextFormField(
                  controller: cepController,
                  decoration: const InputDecoration(
                    labelText: 'CEP',
                  ),
                ),
                TextFormField(
                  controller: numeroController,
                  decoration: const InputDecoration(
                    labelText: 'Número',
                  ),
                ),
                const SizedBox(height: 16.0),
                // ElevatedButton(
                //   onPressed: () {
                //     _salvarAlteracoes();
                //   },
                //   child: const Text('Salvar Alterações'),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
