import 'package:flutter/material.dart';
import 'package:lista_de_filmes/data/models/movie.dart';

class MovieItemWidget extends StatelessWidget {
  const MovieItemWidget({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          child: Image.network(
            movie.urlImage,
            fit: BoxFit.cover,
            width: 120,
            height: 154,
          ),
        ),
      ],
    );
  }
}
