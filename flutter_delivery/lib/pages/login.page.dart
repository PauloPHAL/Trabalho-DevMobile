import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_delivery/pages/cadastro.page.dart';
import 'package:flutter_delivery/pages/home.page.dart';
import 'package:http/http.dart' as http;

import '../model/cliente.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  Future<void> _login() async {
    final String url = 'https://dev.levsistemas.com.br/api.flutter/clientes/auth';

    try {
      final response = await http.post(
        Uri.parse(url),
        body: {
          'email': emailController.text,
          'senha': senhaController.text,
        },
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final Cliente cliente = Cliente.fromJson(responseData);

        _openMyPage(cliente);
      } else {
        _openErro();
      }
    } catch (error) {
      print('Erro ao fazer login: $error');
    }
  }

  void _openErro(){
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Erro de autenticação'),
          content: const Text('Credenciais inválidas. Tente novamente.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

  void _openMyPage(Cliente cliente){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage(cliente)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF8A2387),
                  Color(0xFFE94057),
                  Color(0xFFF27121)
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 80),
                SizedBox(
                  width: 50,
                  height: 50,
                  child: Image.asset('images/logo.png'),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Flutter Delivery",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  height: 480,
                  width: 345,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 30),
                      const Text(
                        'Olá',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Acesse sua conta realizando o login",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 250,
                        child: TextField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            labelText: "Email",
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 250,
                        child: TextField(
                          controller: senhaController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: "Senha",
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          _login();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFFE94057),
                                Color(0xFFF27121),
                              ],
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CadastroPage(),
                            ),
                          );
                        },
                        child: const Text(
                          "Cadastrar",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFE94057),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


