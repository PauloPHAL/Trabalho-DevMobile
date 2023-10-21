import 'package:flutter/material.dart';
import 'package:flutter_delivery/pages/login.page.dart';
import 'package:flutter_delivery/pages/home.page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.red,
        fontFamily: 'Montserrat',
        textTheme: TextTheme(
          bodyText2: TextStyle(
            fontWeight: FontWeight.bold, // Defina o peso da fonte como bold (mais grosso)
          ),
          // Outros estilos de texto, se necessário
        ),
        // Outras configurações do tema do aplicativo
      ),
      home: LoginPage(),
    );
  }
}

