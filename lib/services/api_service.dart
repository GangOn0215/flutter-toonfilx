import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/toonflix_detail_model.dart';
import 'package:toonflix/models/toonflix_episode_model.dart';
import 'package:toonflix/models/toonflix_model.dart';

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<ToonflixModel>> getTodaysToons() async {
    List<ToonflixModel> toonflixList = [];
    final Uri uri = Uri.parse('$baseUrl/$today');
    final http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      final List<dynamic> jsonWebtoons = jsonDecode(response.body);

      for (var jsonWebtoon in jsonWebtoons) {
        toonflixList.add(ToonflixModel.fromJson(jsonWebtoon));
      }

      return toonflixList;
    }
    throw Error();
  }

  static Future<ToonflixDetailModel> getToonflixDetail(String id) async {
    final Uri url = Uri.parse('$baseUrl/$id');

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonToonflixDetail = jsonDecode(response.body);

      return ToonflixDetailModel.fromJson(jsonToonflixDetail);
    }

    throw Error();
  }

  static Future<List<ToonflixEpisodeModel>> getToonflixEpisode(
      String id) async {
    List<ToonflixEpisodeModel> toonflixEpisodeList = [];

    Uri url = Uri.parse('$baseUrl/$id/episodes');

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      var toonflixEpisodes = jsonDecode(response.body);

      for (var toonflixEpisode in toonflixEpisodes) {
        toonflixEpisodeList.add(ToonflixEpisodeModel.fromJson(toonflixEpisode));
      }

      return toonflixEpisodeList;
    }

    throw Error();
  }
}
