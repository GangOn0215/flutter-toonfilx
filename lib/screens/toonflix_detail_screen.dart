import 'package:flutter/material.dart';
import 'package:toonflix/models/toonflix_model.dart';

class ToonflixDetailScreen extends StatelessWidget {
  final ToonflixModel toonflixRow;

  const ToonflixDetailScreen({
    super.key,
    required this.toonflixRow,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          toonflixRow.title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 250,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      offset: const Offset(10, 10),
                      color: Colors.black.withOpacity(0.3),
                    ),
                  ],
                ),
                child: Image.network(
                  toonflixRow.thumb,
                  headers: const {
                    "User-Agent":
                        "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
