import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/dimensions.dart';

class TextInput extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;

  const TextInput(
      {super.key, required this.hintText, required this.obscureText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: false,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius30),
          borderSide: BorderSide.none,

        ),
      ),
    );
  }
}
