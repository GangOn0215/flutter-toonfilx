class ToonflixEpisodeModel {
  final String id;
  final String title;
  final String rating;
  final String date;

  ToonflixEpisodeModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        rating = json['rating'],
        date = json['date'];
}
