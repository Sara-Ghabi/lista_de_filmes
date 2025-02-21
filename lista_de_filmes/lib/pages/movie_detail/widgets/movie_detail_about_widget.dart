import 'package:flutter/material.dart';
import 'package:lista_de_filmes/data/models/movie.dart';

class MovieDetailAboutWidget extends StatelessWidget {
  const MovieDetailAboutWidget({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 4),
                  child: Icon(
                    Icons.calendar_month_outlined,
                    size: 16,
                    color: Colors.amber,
                  ),
                ),
                Text('Ano ${movie.year}'),
                Padding(
                  padding: EdgeInsets.only(left: 8, right: 4),
                  child: Icon(
                    Icons.star_border_outlined,
                    size: 16,
                    color: Colors.amber,
                  ),
                ),
                Text('Média de votos: ${movie.voteAverage}'),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Sinopse',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(movie.description ?? 'Filme sem descrição'),
          ],
        ),
      ),
    );
  }
}
