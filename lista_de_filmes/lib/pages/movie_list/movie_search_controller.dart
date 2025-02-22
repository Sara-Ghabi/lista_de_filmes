import 'package:lista_de_filmes/data/models/movie.dart';
import 'package:lista_de_filmes/data/movie_api.dart';
import 'package:lista_de_filmes/service_locator.dart';

class MovieSearchController {
  final api = getIt<MovieApi>();

  Future<List<Movie>> searchMovie(String query) => api.searchMovie(query);
}
