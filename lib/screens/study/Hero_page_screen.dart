import 'package:flutter/material.dart';

class HeroPageScreen extends StatelessWidget {
  const HeroPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Hero 2',
        ),
      ),
      body: Hero(
        tag: 'img',
        child: Image.network(
          'https://wallpaperaccess.com/full/508201.jpg',
        ),
      ),
    );
  }
}
