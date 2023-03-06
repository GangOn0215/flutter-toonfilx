import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:toonflix/models/toonflix_detail_model.dart';
import 'package:toonflix/models/toonflix_episode_model.dart';
import 'package:toonflix/models/toonflix_model.dart';
import 'package:toonflix/services/api_service.dart';
import 'package:toonflix/widgets/toonflix/toonflix_detail_weiget.dart';
import 'package:toonflix/widgets/toonflix/toonflix_episode_weiget.dart';

class ToonflixDetailScreen extends StatefulWidget {
  final ToonflixModel toonflixRow;

  const ToonflixDetailScreen({
    super.key,
    required this.toonflixRow,
  });

  @override
  State<ToonflixDetailScreen> createState() => _ToonflixDetailScreenState();
}

class _ToonflixDetailScreenState extends State<ToonflixDetailScreen> {
  late Future<ToonflixDetailModel> toonflixDetail;
  late Future<List<ToonflixEpisodeModel>> toonflixEpisodeList;

  @override
  void initState() {
    super.initState();

    toonflixDetail = ApiService.getToonflixDetail(widget.toonflixRow.id);
    toonflixEpisodeList = ApiService.getToonflixEpisode(widget.toonflixRow.id);
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 2;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.toonflixRow.title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 200,
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
                      tag: widget.toonflixRow.id,
                      child: Image.network(
                        widget.toonflixRow.thumb,
                        headers: const {
                          "User-Agent":
                              "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              FutureBuilder(
                future: toonflixDetail,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ToonflixDetailWeiget(toonflixDetail: snapshot.data!);
                  }

                  return const CircularProgressIndicator();
                },
              ),
              const SizedBox(
                height: 20,
              ),
              FutureBuilder(
                future: toonflixEpisodeList,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        for (var episode in snapshot.data!)
                          ToonflixEpisodeWeiget(
                            episode: episode,
                            toonflixId: widget.toonflixRow.id,
                          )
                      ],
                    );
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
