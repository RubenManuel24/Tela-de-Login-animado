import 'package:flutter/material.dart';
class InputCustomizado extends StatelessWidget {

  var hint;
  var obscureText;
  var icon;
  
  InputCustomizado({ 
    @required this.hint, 
    this.obscureText = false, 
    this.icon = const Icon(Icons.person)
    });

  @override
  Widget build(BuildContext context) {
    return Container(
                 padding: EdgeInsets.all(6),
                    child: TextField(
                      obscureText: this.obscureText,
                      decoration: InputDecoration(
                         hintText:this.hint,
                        icon: this.icon,
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                       )
                     ),
                   ),
                );
  }
}
