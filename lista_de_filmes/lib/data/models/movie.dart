import 'package:intl/intl.dart';

class Movie {
  Movie({
    required this.id,
    this.name,
    this.backDropPath,
    this.description,
    this.posterPath,
    this.releaseDate,
    this.voteAverage,
  })  : urlImage = posterPath != null
            ? 'https://image.tmdb.org/t/p/w500${posterPath}'
            : 'https://via.placeholder.com/150',
        year = releaseDate != null
            ? DateFormat('yyyy').format(DateTime.parse(releaseDate))
            : null,
        urlImage2 = backDropPath != null
            ? 'https://image.tmdb.org/t/p/w500${backDropPath}'
            : 'https://via.placeholder.com/150';

  final int id;
  final String? name;
  final String? backDropPath;
  final String urlImage2;
  final String? description;
  final String? posterPath;
  final String urlImage;
  final String? releaseDate;
  final String? year;
  final double? voteAverage;

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        id: json['id'] as int,
        name: json['title'] as String?,
        backDropPath: json['backdrop_path'] as String?,
        description: json['overview'] as String?,
        posterPath: json['poster_path'] as String,
        releaseDate: json['release_date'] as String?,
        voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
      );
}
