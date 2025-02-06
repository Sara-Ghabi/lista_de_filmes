import 'dart:async';

import 'package:lista_de_filmes/data/models/movie.dart';
import 'package:lista_de_filmes/data/movie_api.dart';
import 'package:lista_de_filmes/service_locator.dart';

class MovieListController {
  final api = getIt<MovieApi>();

  final _controller = StreamController<List<Movie>>();
  Stream<List<Movie>> get stream => _controller.stream;

  void init() {
    print('Inicializando MovieListController...');
    getMovies();
  }

  Future<void> getMovies() async {
    try {
      var result = await api.getMovies();

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
