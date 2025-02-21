import 'package:flutter/material.dart';
import 'package:lista_de_filmes/data/models/movie.dart';

class MovieDetailCoverWidget extends StatelessWidget {
  const MovieDetailCoverWidget({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 300,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              movie.urlImage,
              fit: BoxFit.cover,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [Colors.black26, Colors.black87],
                  stops: [0.0, 1.0],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: TweenAnimationBuilder(
                  tween: Tween<double>(begin: 1.0, end: 0.0),
                  duration: Duration(milliseconds: 500),
                  builder: (BuildContext context, double value, Widget? child) {
                    return Transform.scale(
                      scale: 1 + value,
                      child: Opacity(
                        opacity: 1 - value,
                        child: Text(
                          movie.name ?? 'Sem título',
                          style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
