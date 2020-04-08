import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool isPassword;
  final bool isBlue;
  final TextInputType inputType;
  final TextEditingController controller;
  final Function() onChanged;

  CustomTextField( {
    @required this.hintText,
    @required this.icon,
    @required this.isPassword,
    @required this.isBlue,
    @required this.controller,
    @required this.inputType,
      this.onChanged, bool autofocus
  }
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15), //VALOR ALINHAMENTO DA BORDA
      decoration: BoxDecoration(
          color: isBlue ? Color(0xFF374562) : Colors.grey[200],
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: TextField(
        keyboardType: inputType,
        obscureText: isPassword,
        controller: controller,
        onEditingComplete: onChanged,
        style: TextStyle(
            fontSize: 18, color: isBlue ? Color(0xFFC2C2C2) : Colors.grey[600]),
        decoration: InputDecoration(

          // ESTILO DA FONTE
            hintStyle: TextStyle(
                color: isBlue ? Color(0xFFC2C2C2) : Colors.grey[600],
                fontSize: 16),
                hintText: hintText.toString(),
            icon: IconTheme(
              data: IconThemeData(
                  color: isBlue ? Color(0xFFC2C2C2) : Colors.grey[600]),
              child: Icon(
                icon,
                size: 20, // TAMANHO DO ICONE DENTRO DO CAMPO TEXTO
              ),
            ),
            border: InputBorder.none),
      ),
    );
  }
}
