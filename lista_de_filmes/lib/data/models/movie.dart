class Movie {
  Movie({
    required this.id,
    this.name, 
    this.backDropPath,
    this.description,
    required this.urlImage,
    this.releaseDate,
    this.voteAverage, 
  });

  final int id;
  final String? name;
  final String? backDropPath; 
  final String? description; 
  final String urlImage; 
  final String? releaseDate; 
  final String? voteAverage; 

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        id: json['id'] as int,
        name: json['title'] as String?,
        backDropPath: json['backdrop_path'] as String?, 
        description: json['overview'] as String?,
        urlImage: json['poster_path'] as String,
        releaseDate: json['release_date'] as String?,
        voteAverage: json['vote_average'].toString(), 
      );
}