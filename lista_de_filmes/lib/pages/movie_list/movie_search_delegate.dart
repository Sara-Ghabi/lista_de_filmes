import 'package:flutter/material.dart';
import 'package:lista_de_filmes/data/models/movie.dart';
import 'package:lista_de_filmes/pages/movie_list/movie_search_controller.dart';
import 'package:lista_de_filmes/pages/movie_list/widgets/movie_item_widget.dart';
import 'package:lista_de_filmes/widgets/progress_indicator_widget.dart';

class MovieSearchDelegate extends SearchDelegate {
  final controller = MovieSearchController();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return buildSuggestions(context);
    }

    if (query.length < 3) {
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(16),
        child: Text('A consulta $query é curta. O mínimo de caracteres é 3'),
      );
    }

    return FutureBuilder(
      future: controller.searchMovie(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return ProgressIndicatorWidget();
        }

        List<Movie> movies = snapshot.data!;

        if (movies.isEmpty) {
          return Center(
            child: Text('Nenhum filme encontrado com esse nome'),
          );
        }

        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) =>
              MovieItemWidget(movie: movies[index]),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SizedBox.shrink();
  }
}
