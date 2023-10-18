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
      ),
      home: LoginPage(),
    );
  }
}

