import 'package:bilheteria_panucci/models/movie.dart';
import 'package:bilheteria_panucci/screens/movie_screen.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({Key? key, required this.movie}) : super(key: key);
  final Movie movie;
  final String notFound =
      "https://user-images.githubusercontent.com/24848110/33519396-7e56363c-d79d-11e7-969b-09782f5ccbab.png";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Card(
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieScreen(movie: movie),
                      ),
                    );
                  },
                  child: movie.imageURI != null
                      ? Ink(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: !(movie.name == "The Big Lebowski")
                          ? DecorationImage(
                          image: NetworkImage(movie.imageURI!),
                          fit: BoxFit.cover)
                          : DecorationImage(
                          image: NetworkImage(notFound)),
                    ),
                  )
                      : Ink(
                    child: const Center(
                      child: Icon(Icons.error),
                    ),
                  ))),
        ),
        Text(
          movie.name,
          style: Theme.of(context).textTheme.displaySmall,
        )
      ],
    );
  }
}
