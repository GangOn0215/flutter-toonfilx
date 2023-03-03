import 'package:flutter/material.dart';
import 'package:toonflix/models/toonflix_model.dart';
import 'package:toonflix/services/api_service.dart';
import 'package:toonflix/widgets/toonflix/toonflix_weight.dart';

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
            return Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Expanded(child: makeList(snapshot))
              ],
            );
            // return makeList(snapshot);
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<ToonflixModel>> snapshot) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      itemBuilder: (context, index) {
        var webtoonRow = snapshot.data![index];
        return ToonflixWeight(
          toonflixRow: webtoonRow,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 40,
      ),
    );
  }
}
