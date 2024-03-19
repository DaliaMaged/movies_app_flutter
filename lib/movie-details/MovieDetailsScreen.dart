import 'package:flutter/material.dart';
import 'package:movies_app/movie-details/MovieDetailsViewmodel.dart';
import 'package:movies_app/movie-details/MovieDetailsWidget.dart';
import 'package:provider/provider.dart';

import '../MoviesAppTheme.dart';

class MovieDetailsScreen extends StatefulWidget {
  static String screenTitle = "movieDetailsScreen";

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  late var args;
  MovieDetailsViewmodel viewmodel = MovieDetailsViewmodel();
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as Map;
    viewmodel.getMovieDetails(movie_id: args['movie_id']);
    return ChangeNotifierProvider(
        create: (context) => viewmodel,
        child: Column(
          children: [
            Consumer<MovieDetailsViewmodel>(
                builder: (context, viewmodel, child) {
              if (viewmodel.movieDetailsResponse == null) {
                return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: MoviesAppTheme.musturedColor,
                  ),
                );
              } else if (viewmodel.errorMessage != null) {
                return Column(
                  children: [
                    Text(
                      "${viewmodel.errorMessage}",
                      style:
                          MoviesAppTheme.moviesAppTheme.textTheme.titleMedium,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          viewmodel.getMovieDetails(movie_id: args['movie_id']);
                        },
                        child: Text(
                          "Try Again",
                          style: MoviesAppTheme
                              .moviesAppTheme.textTheme.titleMedium,
                        ))
                  ],
                );
              } else {
                return MovieDetailsWidget(movieDetailsResponse: viewmodel.movieDetailsResponse);
              }
            }),
          ],
        ));
  }
}
