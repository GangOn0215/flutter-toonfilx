import 'package:flutter/material.dart';
import 'package:toonflix/services/api_service.dart';

class ToonflixScreen extends StatefulWidget {
  const ToonflixScreen({super.key});

  @override
  State<ToonflixScreen> createState() => _ToonflixScreenState();
}

class _ToonflixScreenState extends State<ToonflixScreen> {
  @override
  void initState() {
    super.initState();

    ApiService().getTodaysToons();
  }

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
