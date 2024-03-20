import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/Models/MovieDetailsResponse.dart';

import '../MoviesAppTheme.dart';

class MovieDetailsWidget extends StatefulWidget {
  MovieDetailsResponse? movieDetailsResponse;

  MovieDetailsWidget({required this.movieDetailsResponse});

  @override
  State<MovieDetailsWidget> createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CachedNetworkImage(
          // height: MediaQuery.of(context).size.height*0.2,
          // width: double.infinity,
          imageUrl: 'https://image.tmdb.org/t/p/original${widget.movieDetailsResponse!.backdropPath!}',
          errorWidget: (context, _, __) => Icon(Icons.error_outline),
          placeholder: (context, url) => Center(
            child: Center(
              child: CircularProgressIndicator(
                color: MoviesAppTheme.musturedColor,
              ),
            ),
          ),
        ),
        Container(
            margin: EdgeInsets.only(top: 8, bottom: 12, left: 8, right: 8),
            child: Text(
              "${widget.movieDetailsResponse!.title}",
              style: MoviesAppTheme.moviesAppTheme.textTheme.titleLarge,
            )
        ),
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              child: CachedNetworkImage(
                imageUrl:'https://image.tmdb.org/t/p/original${widget.movieDetailsResponse!.posterPath!}',
                errorWidget: (context, _, __) => Icon(Icons.error_outline),
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                    color: MoviesAppTheme.musturedColor,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                   height: MediaQuery.of(context).size.height*0.07,
                   width: MediaQuery.of(context).size.width*0.5,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, int) => Container(
                      padding: EdgeInsets.all(12),
                      child: Text(
                        widget.movieDetailsResponse!.genres![int].name!,
                        style: MoviesAppTheme.moviesAppTheme.textTheme.titleSmall,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    widget.movieDetailsResponse!.title!,
                    style: MoviesAppTheme.moviesAppTheme.textTheme.titleSmall,
                  ),
                ),
                Row(
                  children: [
                    //Image.asset("assets/star_ic.png",width: MediaQuery.of(context).size.width*0.1,),
                    Icon(
                      Icons.star,
                      color: MoviesAppTheme.musturedColor,
                    ),
                    Text(
                      "${widget.movieDetailsResponse!.voteAverage}",
                      style: MoviesAppTheme.moviesAppTheme.textTheme.titleSmall
                          ?.copyWith(color: MoviesAppTheme.whiteColor),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
