class Movie {
  Movie({
    required this.id,
    required this.name,
    required this.backDropPath,
    required this.description,
    required this.urlImage,
    required this.releaseDate,
    required this.voteAverage,
  });
  final int id;
  final String name;
  final String backDropPath;
  final String description;
  final String urlImage;
  final String releaseDate;
  final String voteAverage;

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
      id: json['id'],
      name: json['title'] ?? 'Sem titulo',
      backDropPath: json['backDropPath'],
      description: json['overview'],
      urlImage: json['poster_path'],
      releaseDate: json['release_date'],
      voteAverage: json['vote_average']);
}
