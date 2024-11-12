import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextButton extends StatelessWidget {
  CustomTextButton(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.textColor,
      this.fontSize});
  final String text;
  final Color textColor;
  void Function()? onPressed;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: textColor, fontSize: 20),
      ),
    );
  }
}
