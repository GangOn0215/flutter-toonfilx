import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Color fontColor;
  final Color backgroundColor;

  const Button({
    super.key,
    required this.text,
    required this.fontColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(40),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 30,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: fontColor,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
