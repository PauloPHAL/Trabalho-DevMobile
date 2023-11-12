import 'package:flutter/material.dart';
import 'package:flutter_delivery/pages/login.page.dart';

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _cadastrar() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEAEAEA),
        title: const Row(
          children: <Widget>[
            Text('Cadastro'),
          ],
        ),
      ),
      body: Center(
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
              const SizedBox(height: 70),
              Container(
                height: 580,
                width: 345,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 250,
                      child: const TextField(
                        decoration: InputDecoration(
                          labelText: "Nome",
                        ),
                      ),
                    ),
                    Container(
                      width: 250,
                      child: const TextField(
                        decoration: InputDecoration(
                          labelText: "Telefone",
                        ),
                      ),
                    ),
                    Container(
                      width: 250,
                      child: const TextField(
                        decoration: InputDecoration(
                          labelText: "Endereço",
                        ),
                      ),
                    ),
                    Container(
                      width: 250,
                      child: const TextField(
                        decoration: InputDecoration(
                          labelText: "CEP",
                        ),
                      ),
                    ),
                    Container(
                      width: 250,
                      child: const TextField(
                        decoration: InputDecoration(
                          labelText: "Número",
                        ),
                      ),
                    ),
                    Container(
                      width: 250,
                      child: const TextField(
                        decoration: InputDecoration(
                          labelText: "Email",
                        ),
                      ),
                    ),
                    Container(
                      width: 250,
                      child: const TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Senha",
                        ),
                      ),
                    ),
                    Container(
                      width: 250,
                      child: const TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Confirmar senha",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        _cadastrar(); // Chame a função _login quando o botão for pressionado
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
                            'Cadastrar',
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
