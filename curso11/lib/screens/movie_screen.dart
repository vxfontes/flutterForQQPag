import 'package:bilheteria_panucci/logic/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:bilheteria_panucci/components/movie_screen/tab_bar_movie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/movie_screen/poster.dart';
import '../components/movie_screen/poster_card.dart';
import '../models/movie.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key, required this.movie});
  final Movie movie;
  final String notFound =
      "https://user-images.githubusercontent.com/24848110/33519396-7e56363c-d79d-11e7-969b-09782f5ccbab.png";

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.read<ThemeCubit>();
    themeCubit.changeTheme(movie.genre);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                !(movie.name == "The Big Lebowski")
                    ? Poster(imageURL: movie.imageURI)
                    : Poster(imageURL: notFound),
                PosterCard(
                  title: movie.name,
                  genre: movie.genre,
                  classification: movie.classification,
                  duration: movie.duration,
                ),
              ],
            ),
          ),
          Expanded(child: TabBarMovie(movie: movie)),
        ],
      ),
    );
  }
}
