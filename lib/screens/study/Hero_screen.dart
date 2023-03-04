import 'package:flutter/material.dart';
import 'package:toonflix/screens/study/Hero_page_screen.dart';
import 'package:toonflix/utils/common.dart';

class HeroScreen extends StatelessWidget {
  const HeroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: commonThemeData(),
      home: const Page1(),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: 'Hero',
        context: context,
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HeroPageScreen(),
            ),
          );
        },
        child: Hero(
          tag: 'img',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      offset: const Offset(5, 5),
                    ),
                  ],
                ),
                child: Image.network(
                  'https://wallpaperaccess.com/full/508201.jpg',
                  width: 200,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
