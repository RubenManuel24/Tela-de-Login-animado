import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:loginanimado/botao_animado.dart';
import 'package:loginanimado/input_customizado.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  
 late AnimationController _animationController;
 late Animation<double> _animationBlur;
 late Animation<double> _animationFade;
 late Animation<double> _animationSize;

 @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: Duration(
         seconds: 2,
      ),
      vsync: this
    );

    _animationBlur = Tween<double>(
      begin: 6,
      end: 0
    ).animate(CurvedAnimation(
      parent: _animationController, 
      curve: Curves.easeInCirc)
    );

    _animationFade = Tween<double>(
      begin: 0,
      end: 1
    ).animate(CurvedAnimation(
      parent: _animationController, 
      curve: Curves.easeInCirc)
    );

    _animationSize = Tween<double>(
      begin: 0,
      end: 500
    ).animate(CurvedAnimation(
      parent: _animationController, 
      curve: Curves.decelerate)
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    timeDilation = 6;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            AnimatedBuilder(
              animation: _animationBlur, 
              builder: (context, Widget){
                return Container(
                    height: 400,
                    decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("imagens/fundo.png"),
                      fit: BoxFit.fill
                      )
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: _animationBlur.value,
                        sigmaY: _animationBlur.value,
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 10,
                            top: 0,
                            child: FadeTransition(
                              opacity: _animationFade,
                              child: Image.asset("imagens/detalhe1.png"),
                              )
                            ),
                          Positioned(
                            left: 50,
                            top: 0,
                            child: FadeTransition(
                              opacity: _animationFade,
                              child: Image.asset("imagens/detalhe2.png"),)
                              ),
                        ],
                    ),
                      )
                 );

                }
              ),
             Padding(padding: EdgeInsets.only(left: 30, right: 30),
             child: Column(
              children: [
                AnimatedBuilder(
                  animation:  _animationSize, 
                  builder: (context, widget){
                    return Container(
                      width:  _animationSize.value,
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
                            obscureText: true,
                            icon: Icon(Icons.lock)
                          )
                        ],
                      )
                    );
                  }),
                SizedBox(height: 20),
                BotaoAnimado(
                  animationController: _animationController,
                ),
                SizedBox(height: 18),
                FadeTransition(
                  opacity: _animationFade,
                  child: Text("Esqueci minha senha!",
                  style: TextStyle(
                    color: Color.fromRGBO(255, 100, 127, 1),
                      fontWeight: FontWeight.bold
                     ),
                ))
              ],
            ),
           )
          ],
        ),
      ),

    );
  }
}