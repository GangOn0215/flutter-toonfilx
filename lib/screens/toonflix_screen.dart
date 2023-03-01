import 'package:flutter/material.dart';

class ToonflixScreen extends StatefulWidget {
  const ToonflixScreen({super.key});

  @override
  State<ToonflixScreen> createState() => _ToonflixScreenState();
}

class _ToonflixScreenState extends State<ToonflixScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Toonflix',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}
