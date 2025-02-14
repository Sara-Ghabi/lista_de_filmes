import 'package:flutter/material.dart';
import 'package:lista_de_filmes/data/models/movie.dart';
import 'package:lista_de_filmes/pages/movie_list/movie_list_controller.dart';
import 'package:lista_de_filmes/pages/movie_list/widgets/movie_item_widget.dart';
import 'package:lista_de_filmes/service_locator.dart';
import 'package:lista_de_filmes/widgets/progress_indicator_widget.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({super.key});

  @override
  State<MovieListPage> createState() => _HomeState();
}

class _HomeState extends State<MovieListPage> {
  final controller = getIt<MovieListController>();

  @override
  void initState() {
    print('Inicializando MovieListPage...');
    controller.init();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Movie App',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: StreamBuilder<List<Movie>>(
        stream: controller.stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const ProgressIndicatorWidget();
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Aconteceu um erro: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('Filmes não encontrados'),
            );
          }

          var movies = snapshot.data!;
          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              var movie = movies[index];

              return MovieItemWidget(movie: movie,);
            },
          );
        },
      ),
    );
  }
}
