import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_delivery/pages/login.page.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class CadastroPage extends StatefulWidget {
  late String imagemBase64;

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();
  TextEditingController enderecoController = TextEditingController();
  TextEditingController cepController = TextEditingController();
  TextEditingController numeroCasaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController confirmarSenhaController = TextEditingController();

  Future<String> imageToBase64(File file) async {
    List<int> imageBytes = await file.readAsBytes();
    return base64Encode(imageBytes);
  }

  Future<void> _cadastrar(String img) async {
    const String url =
        'https://dev.levsistemas.com.br/api.flutter/clientes/cadastra';
    print(img);
    try {
      final response = await http.post(
        Uri.parse(url),
        body: {
          'nome': nomeController.text,
          'email': emailController.text,
          'telefone': telefoneController.text,
          'senha': senhaController.text,
          'cosenha': confirmarSenhaController.text,
          'endereco': enderecoController.text,
          'cep': cepController.text,
          'numeroCasa': numeroCasaController.text,
          'img': img
        },
      );
      if (response.statusCode == 200) {
        _irLogin();
      } else {
        _erro();
      }
    } catch (error) {
      print('Erro ao fazer cadastro: $error');
    }
  }

  void _irLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  void _erro() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Erro de cadastro'),
          content: const Text('Senhas são diferentes'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFEAEAEA),
        title: const Row(
          children: <Widget>[
            Text('Cadastro'),
          ],
        ),
      ),
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
                const SizedBox(height: 70),
                Container(
                  height: 660,
                  width: 345,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 250,
                        child: TextField(
                          controller: nomeController,
                          decoration: const InputDecoration(
                            labelText: "Nome",
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 250,
                        child: TextField(
                          controller: telefoneController,
                          decoration: const InputDecoration(
                            labelText: "Telefone",
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 250,
                        child: TextField(
                          controller: enderecoController,
                          decoration: const InputDecoration(
                            labelText: "Endereço",
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 250,
                        child: TextField(
                          controller: cepController,
                          decoration: const InputDecoration(
                            labelText: "CEP",
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 250,
                        child: TextField(
                          controller: numeroCasaController,
                          decoration: const InputDecoration(
                            labelText: "Número",
                          ),
                        ),
                      ),
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
                      SizedBox(
                        width: 250,
                        child: TextField(
                          controller: confirmarSenhaController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: "Confirmar senha",
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 250,
                        child: FloatingActionButton(
                          heroTag: "BotaoCamera",
                          onPressed: () async {
                            var imagem = await ImagePicker()
                                .pickImage(source: ImageSource.camera);
                            if (imagem != null) {
                              File imagemSelecionada = File(imagem.path);
                              widget.imagemBase64 =
                                  await imageToBase64(imagemSelecionada);
                            }
                          },
                          child: const Icon(Icons.photo_camera),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          _cadastrar(widget.imagemBase64);
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
      ),
    );
  }
}
