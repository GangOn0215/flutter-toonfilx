import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/toonflix_model.dart';

class ApiService {
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";
  List<ToonflixModel> toonflixList = [];

  void getTodaysToons() async {
    final Uri uri = Uri.parse('$baseUrl/$today');
    final http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      final dynamic jsonWebtoons = jsonDecode(response.body);

      for (var jsonWebtoon in jsonWebtoons) {
        var webtoon = ToonflixModel.fromJson(jsonWebtoon);
        toonflixList.add(webtoon);
      }

      for (var toonflix in toonflixList) {
        print(toonflix.thumb);
      }

      return;
    }
    throw Error();
  }
}
