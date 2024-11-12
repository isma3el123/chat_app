import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFaild extends StatelessWidget {
  CustomTextFaild({
    super.key,
    this.hintText,
    this.inputType,
    this.onchange,
    this.obscureText = false,
    this.validator,
  });

  Function(String)? onchange;
  String? hintText;
  bool obscureText;
  TextInputType? inputType;
  String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      obscureText: obscureText,
      onChanged: onchange,
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.white),
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.amber, width: 2.0),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
      keyboardType: inputType,
    );
  }
}
