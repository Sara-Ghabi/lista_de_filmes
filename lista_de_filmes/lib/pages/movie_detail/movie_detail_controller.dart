import 'dart:async';

import 'package:lista_de_filmes/data/models/movie.dart';
import 'package:lista_de_filmes/data/movie_api.dart';
import 'package:lista_de_filmes/service_locator.dart';

class MovieDetailController {
  final api = getIt<MovieApi>();

  final _controller = StreamController<Movie>();
  Stream<Movie> get stream => _controller.stream;
  late Movie _movie;

  void init(Movie movie) {
    _movie = movie;
    print('Inicializando MovieListController...');
    getMovie();
  }

  Future<void> getMovie() async {
    try {
      var result = await api.getMovie(_movie.id);

      _controller.sink.add(result);
    } catch (e) {
      print('Ocorreu um erro ao pegar os filmes: $e');
      _controller.sink.addError(e);
    }
  }

  void dispose() {
    _controller.close();
  }
}
