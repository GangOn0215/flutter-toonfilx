import 'package:flutter/material.dart';
import 'package:toonflix/models/toonflix_model.dart';
import 'package:toonflix/services/api_service.dart';

class ToonflixScreen extends StatefulWidget {
  const ToonflixScreen({super.key});

  @override
  State<ToonflixScreen> createState() => _ToonflixScreenState();
}

class _ToonflixScreenState extends State<ToonflixScreen> {
  List<ToonflixModel> toons = [];
  bool isLoading = true;

  void waitForWebToons() async {
    toons = await ApiService.getTodaysToons();
    isLoading = false;

    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    waitForWebToons();
  }

  @override
  Widget build(BuildContext context) {
    print(toons);
    print(isLoading);

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
