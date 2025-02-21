import 'package:flutter/material.dart';
import 'package:lista_de_filmes/data/models/movie.dart';
import 'package:lista_de_filmes/pages/movie_detail/movie_detail_controller.dart';
import 'package:lista_de_filmes/pages/movie_detail/widgets/movie_detail_about_widget.dart';
import 'package:lista_de_filmes/pages/movie_detail/widgets/movie_detail_cover_widget.dart';
import 'package:lista_de_filmes/service_locator.dart';
import 'package:lista_de_filmes/widgets/progress_indicator_widget.dart';

class MovieDetailPage extends StatefulWidget {
  const MovieDetailPage({super.key, required this.movie});

  final Movie movie;

  @override
  State<MovieDetailPage> createState() => _HomeState();
}

class _HomeState extends State<MovieDetailPage> {
  final controller = getIt.registerSingleton(MovieDetailController());

  @override
  void initState() {
    print('Inicializando MovieListPage...');
    controller.init(widget.movie);
    super.initState();
  }

  @override
  void dispose() {
    //método para destruir a instância criada para o detalhe do filme ao sair
    getIt.unregister(instance: controller);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<Movie>(
        stream: controller.stream,
        initialData: widget.movie,
        builder: (context, snapshot) {
          var movie = snapshot.data!;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const ProgressIndicatorWidget();
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Aconteceu um erro: ${snapshot.error}'),
            );
          }

          return CustomScrollView(
            slivers: [
              MovieDetailCoverWidget(movie: movie),
              MovieDetailAboutWidget(movie: movie),
            ],
          );
        },
      ),
    );
  }
}
