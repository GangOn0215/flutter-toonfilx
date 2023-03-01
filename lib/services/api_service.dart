import 'dart:convert';

import 'package:http/http.dart' as http;
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
}
