class ToonflixDetailModel {
  final String title;
  final String about;
  final String genre;
  final String age;

  ToonflixDetailModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        about = json['about'],
        genre = json['genre'],
        age = json['age'];
}
