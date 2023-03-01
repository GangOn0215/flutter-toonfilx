class ToonflixModel {
  final String title;
  final String thumb;
  final String id;

  ToonflixModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];
}
