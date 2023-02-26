import 'package:flutter/material.dart';

class StateButtonSmall extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const StateButtonSmall({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: 15,
        ),
      ),
    );
  }
}
