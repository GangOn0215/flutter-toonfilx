import 'package:flutter/material.dart';
import 'package:toonflix/models/toonflix_detail_model.dart';

class ToonflixDetailWeiget extends StatelessWidget {
  final ToonflixDetailModel toonflixDetail;

  const ToonflixDetailWeiget({
    super.key,
    required this.toonflixDetail,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          toonflixDetail.about,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          '${toonflixDetail.title} / ${toonflixDetail.age}',
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }
}
