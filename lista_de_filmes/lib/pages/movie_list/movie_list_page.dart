import 'package:flutter/material.dart';
import 'package:lista_de_filmes/pages/movie_list/movie_list_controller.dart';
import 'package:lista_de_filmes/service_locator.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({super.key});

  @override
  State<MovieListPage> createState() => _HomeState();
}

class _HomeState extends State<MovieListPage> {
  final controller = getIt<MovieListController>();

  @override
  void initState() {
    controller.init();
    super.initState();
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
      body: StreamBuilder(
        stream: controller.stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('waiting');
          }

          var movies = snapshot.data!;
          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              var movie = movies[index];

              return ListTile(
                title: Text(movie.name),
              );
            },
          );
        },
      ),
    );
  }
}
