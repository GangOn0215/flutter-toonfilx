import 'package:flutter/material.dart';

class ButtonNav extends StatelessWidget {
  final String text;
  final WidgetBuilder builder;

  const ButtonNav({
    super.key,
    required this.text,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.black.withOpacity(0.8),
        minimumSize: Size(MediaQuery.of(context).size.width - 210, 40),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: builder,
          ),
        );
      },
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFFE75480),
        ),
      ),
    );
  }
}
