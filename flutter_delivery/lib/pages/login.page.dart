import 'package:flutter/material.dart';
import 'package:flutter_delivery/pages/cadastro.page.dart';
import 'package:flutter_delivery/pages/home.page.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _login() {
    String email = emailController.text;
    String password = passwordController.text;

    // Realize a validação e autenticação aqui, você pode usar Firebase, por exemplo.

    if (true) {
      // Login bem-sucedido, redirecione para a próxima tela.
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      // Exiba uma mensagem de erro ou feedback para o usuário.
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Erro de autenticação'),
            content: Text('Credenciais inválidas. Tente novamente.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Fechar'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
             ]
           )
         ),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             const SizedBox(height: 80,),
             SizedBox(
               width: 50, // Largura desejada
               height: 50, // Altura desejada
               child: Image.asset('images/logo.png'),
             ),
             const SizedBox(height: 15,),
             const Text(
               "Flutter Delivery",
                style: TextStyle(
                 color: Colors.black, // Remova o segundo "TextStyle"
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
                    borderRadius: BorderRadius.circular(10)
               ),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   const SizedBox(height: 30,),
                   const Text('Olá',
                   style: TextStyle(
                     fontSize: 35,
                     fontWeight: FontWeight.bold
                   ),
                   ),
                   const SizedBox(height: 10, ),
                   const Text("Acesse sua conta realizando o login",
                     style: TextStyle(
                       fontSize: 15,
                       color: Colors.grey,
                     ),
                   ),
                  const SizedBox(height: 20,),
                  const SizedBox(
                    width: 250,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Email",
                      ),
                    )
                  ),
                 const SizedBox(
                     width: 250,
                     child: TextField(
                       obscureText: true,
                       decoration: InputDecoration(
                         labelText: "Senha",
                       ),
                     )
                   ),
                   const Padding(
                     padding: EdgeInsets.fromLTRB(20, 20, 40, 20),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.end,
                         children: [
                           Text("Esqueceu a Senha?",
                             style: TextStyle(
                               color: Colors.deepOrange,
                             ),
                           )
                         ],
                     ),
                   ),
                   const SizedBox(height: 20,),
                   GestureDetector(
                     onTap: () {
                       _login(); // Chame a função _login quando o botão for pressionado
                     },
                     child: Container(
                       alignment: Alignment.center,
                       width: 250,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(50),

                         gradient: const LinearGradient(
                             colors: [
                               Color(0xFFE94057),
                               Color(0xFFF27121)
                             ] )
                       ),
                       child: const Padding(
                         padding: EdgeInsets.all(12.0),
                         child: Text('Login',
                         style: TextStyle(
                           color: Colors.white,
                           fontSize: 20,
                           fontWeight: FontWeight.bold
                         ),),
                       ),
                     ),
                   ),
                   const SizedBox(
                     height: 30,
                   ),
                   GestureDetector(
                     onTap: () {
                       // Redirecione para a tela de cadastro
                       Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => CadastroPage()), // Use a página de CadastroPage
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
                   const Text("Entrar sem cadastro",
                     style: TextStyle(
                       fontWeight: FontWeight.bold,
                     ),
                   )
                 ],
               ),
             )
           ],
         ),
       )
      ),
    );
  }
}


