import 'package:lista_de_filmes/data/models/movie_comment.dart';

class Movie {
  Movie({
      required this.id,
      required this.name,
      required this.year,
      required this.durationn,
      required this.description,
      required this.gender,
      required this.urlImage,
      required this.comments,
  });
  final int id;
  final String name;
  final int year;
  final int durationn;
  final String description;
  final String gender;
  final String urlImage;
  final List<MovieComment> comments;

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        id: json['id'],
        name: json['name'],
        year: json['year'],
        durationn: json['durationn'],
        description: json['description'],
        gender: json['gender'],
        urlImage: json['urlImage'],
        comments: ((json['comments'] ?? []) as List).map((item) => MovieComment.fromJson(item)).toList(),
      );
}
