import 'package:flutter/material.dart';
class BotaoAnimado extends StatelessWidget {
  
late AnimationController animationController;
late Animation<double> animationLargura;
late Animation<double> animationFade;
late Animation<double> animationBorderRadius;

BotaoAnimado({required this.animationController}) : 

  animationLargura = Tween<double>(
    begin: 0,
    end: 500
  ).animate(
   CurvedAnimation(
    parent: animationController, 
    curve: Interval(0.5, 0.8))),

 animationFade = Tween<double>(
   begin: 0,
   end: 1
  ).animate(CurvedAnimation(
    parent: animationController, 
    curve: Interval(0.6, 0.9))),

 animationBorderRadius = Tween<double>(
    begin: 0,
    end: 20
   ).animate(CurvedAnimation(
    parent: animationController, 
    curve: Interval(0.6, 1)))

;

Widget _builderAnimation(BuildContext context, Widget? widget){
        return InkWell(
                      onTap: (){ },
                      child: Container(
                        width: animationLargura.value,
                        height: 50,
                        child: Center(
                          child: FadeTransition(
                            opacity: animationFade,
                            child: Text("Entrar",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white
                                  ),
                          ),
                            )
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(animationBorderRadius.value),
                          gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(255, 100, 127, 1),
                                Color.fromRGBO(255, 197, 200, 1)
                              ]
                            )
                        ),
                      ),
                    );
}

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
                  animation: animationController, 
                  builder: _builderAnimation,
                  );
  }
}