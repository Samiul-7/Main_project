import 'package:flutter/material.dart';

class my_text_field extends StatelessWidget {
  final controller;
  final hintText;
  final bool obscureText;
  final FocusNode? focusNode;

  const my_text_field({
    super.key,
    required this.controller,   //used here to access the input the user will type in
    required this.hintText,    // used here to make the user know what type of data has to be given
    required this.obscureText,   // text will be visible or not
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:25.0),
      child: TextField(
        controller: controller,
        obscureText :obscureText,
        focusNode: focusNode,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: hintText,
        ),
      ),
    );
  }
}
