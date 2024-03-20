import 'package:flutter/material.dart';
import 'package:movies_app/movie-details/MovieDetailsViewmodel.dart';
import 'package:movies_app/movie-details/MovieDetailsWidget.dart';
import 'package:movies_app/movie-details/similar-movies-widget.dart';
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
    viewmodel.getSimilarMovie(movie_id: args['movie_id']);
    return ChangeNotifierProvider(
        create: (context) => viewmodel,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer<MovieDetailsViewmodel>(
                  builder: (context, viewmodel, child) {
                if (viewmodel.movieDetailsResponse == null) {
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: MoviesAppTheme.musturedColor,
                    ),
                  );
                } else if (viewmodel.errorMessageDetail != null) {
                  return Column(
                    children: [
                      Text(
                        "${viewmodel.errorMessageDetail}",
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
                  print(viewmodel.movieDetailsResponse!.id);
                  return MovieDetailsWidget(
                      movieDetailsResponse: viewmodel.movieDetailsResponse);
                }
              }),
              Container(
                margin: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                child: Text(
                  "More Like This",
                  style: MoviesAppTheme.moviesAppTheme.textTheme.titleLarge
                      ?.copyWith(color: MoviesAppTheme.whiteColor),
                ),
              ),
              Consumer<MovieDetailsViewmodel>(
                  builder: (context, viewmodel, child) {
                if (viewmodel.similarMovies == null) {
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: MoviesAppTheme.musturedColor,
                    ),
                  );
                } else if (viewmodel.errorMessageSimilar != null) {
                  return Column(
                    children: [
                      Text(
                        "${viewmodel.errorMessageSimilar}",
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
                  return Container(
                    height: MediaQuery.of(context).size.height*0.35,
                    child: ListView.builder(
                        itemBuilder: (context, int) => SimilarWidget(
                            result: viewmodel.similarMovies!.results![int]),
                      itemCount:viewmodel.similarMovies!.results!.length ,
                      scrollDirection: Axis.horizontal,
                    ),
                  );
                }
              }),
            ],
          ),
        ));
  }
}
