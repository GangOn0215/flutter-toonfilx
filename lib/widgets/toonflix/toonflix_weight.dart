import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:toonflix/models/toonflix_model.dart';
import 'package:toonflix/screens/toonflix_detail_screen.dart';

class ToonflixWeight extends StatelessWidget {
  final heroController = HeroController();
  final ToonflixModel toonflixRow;

  ToonflixWeight({
    super.key,
    required this.toonflixRow,
  });

  @override
  Widget build(BuildContext context) {
    timeDilation = 2;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              var begin = const Offset(0.0, 1.0);
              var end = Offset.zero;
              var curve = Curves.ease;
              var tween = Tween(begin: begin, end: end).chain(
                CurveTween(
                  curve: curve,
                ),
              );
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
            pageBuilder: (context, animation, secondaryAnimation) =>
                ToonflixDetailScreen(
              toonflixRow: toonflixRow,
            ),
          ),
        );
      },
      child: Column(
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
            child: Hero(
              tag: toonflixRow.id,
              child: Image.network(
                toonflixRow.thumb,
                headers: const {
                  "User-Agent":
                      "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                },
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            toonflixRow.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
