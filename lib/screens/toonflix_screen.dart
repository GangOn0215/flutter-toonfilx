import 'package:flutter/material.dart';
import 'package:toonflix/models/toonflix_model.dart';
import 'package:toonflix/services/api_service.dart';

class ToonflixScreen extends StatelessWidget {
  ToonflixScreen({super.key});

  Future<List<ToonflixModel>> webtoon = ApiService.getTodaysToons();

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
        body: FutureBuilder(
          future: webtoon,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var webtoonRow = snapshot.data![index];

                  return Text(webtoonRow.title);
                },
                separatorBuilder: (context, index) => const SizedBox(
                  width: 10,
                ),
              );
            }

            return const Text('Loading');
          },
        ));
  }
}
