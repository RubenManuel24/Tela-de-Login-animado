import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:loginanimado/input_customizado.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("imagens/fundo.png"),
                  fit: BoxFit.fill
                  )
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 10,
                    top: 0,
                    child: Image.asset("imagens/detalhe1.png")),
                  Positioned(
                    left: 50,
                    top: 0,
                    child: Image.asset("imagens/detalhe2.png")),
                ],
              ),
            ),
           Padding(padding: EdgeInsets.only(left: 30, right: 30),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade100,
                        blurRadius: 17,
                        spreadRadius: 5,
                        //blurStyle: BlurStyle.inner
                      )
                    ]
                  ),
                  child: Column(
                    children: [
                      InputCustomizado(
                        hint:"Email",
                        obscureText: false,
                        icon: Icon(Icons.person)
                      ),
                      InputCustomizado(
                        hint:"Senha",
                        obscureText: false,
                        icon: Icon(Icons.lock)
                      )
                    ],
                  )
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: (){ },
                  child: Container(
                    height: 30,
                    child: Center(
                       child: Text("Entrar",
                               style: TextStyle(
                                 fontWeight: FontWeight.bold,
                                 fontSize: 20,
                                 color: Colors.white
                               ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(255, 100, 127, 1),
                            Color.fromRGBO(255, 197, 200, 1)
                          ]
                        )
                    ),
                  ),
                ),
                SizedBox(height: 18),
                Text("Esqueci minha senha!",
                     style: TextStyle(
                      color: Color.fromRGBO(255, 100, 127, 1),
                      fontWeight: FontWeight.bold
                     ),
                )
              ],
            ),
           )
          ],
        ),
      ),

    );
  }
}