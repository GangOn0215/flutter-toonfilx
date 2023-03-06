import 'package:flutter/material.dart';
import 'package:toonflix/models/toonflix_episode_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ToonflixEpisodeWeiget extends StatelessWidget {
  final Color commonFontColor = const Color(0xFFE75480);
  final ToonflixEpisodeModel episode;
  final String toonflixId;

  const ToonflixEpisodeWeiget({
    super.key,
    required this.episode,
    required this.toonflixId,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final Uri url = Uri.parse(
            'https://comic.naver.com/webtoon/detail?titleId=$toonflixId&no=${episode.id}');
        launchUrl(url);
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.9),
            borderRadius: const BorderRadius.all(Radius.circular(5))),
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10,
        ),
        margin: const EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              episode.title,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_right_outlined,
              color: commonFontColor,
            ),
          ],
        ),
      ),
    );
  }
}
