import 'package:flutter/material.dart';
import 'package:flutter_delivery/pages/tela_abertura.dart';

void main() {
  runApp(const MyApp());
}

/*
Precisa rodar esse comando no terminal!!!

flutter pub run flutter_launcher_icons:main
*/
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.red,
        fontFamily: 'Montserrat',
        textTheme: const TextTheme(
          bodyText2: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: TelaAbertura(),
    );
  }
}
