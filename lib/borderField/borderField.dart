// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: camel_case_types
class borderField extends StatelessWidget{
  final TextEditingController controller;
  final bool obscureText;
  final String labelText;
  final Widget prefixIcon;
  final TextInputType keyboardType;
  
  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
  borderField({
    required this.controller,
    this.obscureText = false,
    required this.labelText,
    required this.prefixIcon,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context){
    return TextField(
      controller: controller,
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