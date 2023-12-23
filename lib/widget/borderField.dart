// ignore_for_file: file_names
import 'package:flutter/material.dart';

class BorderField extends StatelessWidget{
  final TextEditingController controller;
  final bool obscureText;
  final bool autofocus;
  final String labelText;
  final Widget prefixIcon;
  final TextInputType keyboardType;
  
  BorderField({
    required this.controller,
    this.obscureText = false,
    this.autofocus = false,
    required this.labelText,
    required this.prefixIcon,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context){
    return TextField(
      controller: controller,
      autofocus: autofocus,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: prefixIcon,
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(
            color: Colors.black,
          )
        ),
      )
    );
  }
}