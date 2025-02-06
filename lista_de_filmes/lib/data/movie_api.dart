import 'dart:convert';

import 'package:lista_de_filmes/data/models/movie.dart';
import 'package:http/http.dart' as http;

class MovieApi {
  static const _tredingUrl =
      'https://api.themoviedb.org/3/movie/now_playing?api_key=2979d76a4a08690b99797c97cef7a609';

  Future<List<Movie>> getMovies() async {
    print('pegando os filmes da API...');
    var response = await http.get(Uri.parse(_tredingUrl));

    if (response.statusCode == 200) {
      print('filmes retornados com sucesso!');
      final decodeData = json.decode(response.body)['results'] as List;
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      print('falha ao pegar os filmes: ${response.statusCode}');
      throw Exception('Something happing');
    }
  }
}
