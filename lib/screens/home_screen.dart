import 'package:flutter/material.dart';
import 'package:toonflix/utils/common.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'Home', context: context),
      body: const Center(
        child: Text('HGome'),
      ),
    );
  }
}
