import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.background,
      required this.textColor,
      this.borderRadius,
      this.fontSize});
  final String text;
  final Color background;
  final Color textColor;
  final BorderRadius? borderRadius;
  final double? fontSize;
  VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.sizeOf(context).width * 20,
      child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: background,
              shape: RoundedRectangleBorder(borderRadius: borderRadius!)),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(color: textColor),
          )),
    );
  }
}
