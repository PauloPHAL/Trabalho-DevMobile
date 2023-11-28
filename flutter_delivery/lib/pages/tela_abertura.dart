import 'package:flutter/material.dart';
import '../model/cliente.dart';
import 'home.page.dart';
import 'login.page.dart';

class TelaAbertura extends StatefulWidget {
  @override
  _TelaAberturaState createState() => _TelaAberturaState();
}

class _TelaAberturaState extends State<TelaAbertura> {

  void _inicializarAplicacao(BuildContext context) {
    Future futureA = Future.delayed(const Duration(seconds: 5));
    Future<Cliente?>  futureB = Cliente.obter();
    Future.wait([futureA, futureB]).then((List values) {
      Cliente? usuario = values[1];
      if(usuario != null){
        _openMyPage(usuario);
      } else {
        _openLogin();
      }
    });
  }

  void _openMyPage(Cliente cliente){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage(cliente)),
    );
  }

  void _openLogin(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  void initState() {
    super.initState();
    _inicializarAplicacao(context);
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[200],
      alignment: Alignment.center,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset("assets/images/logo.png", fit: BoxFit.contain),
          Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(bottom: 100),
            child: const Text(
              "Delivery",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                decoration: TextDecoration.none,
              ),
            ),
          ),
          const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
