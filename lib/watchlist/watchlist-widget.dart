import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movies_app/Models/SearchResponse.dart';
import 'package:movies_app/Models/watchlistModel.dart';
import 'package:movies_app/MoviesAppTheme.dart';

class WatchListWidget extends StatefulWidget {
  WatchList result;

  WatchListWidget({required this.result});

  @override
  State<WatchListWidget> createState() => _WatchListWidgetState();
}

class _WatchListWidgetState extends State<WatchListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
       width: MediaQuery.of(context).size.width * 0.75,
       height: MediaQuery.of(context).size.height * 0.1,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 3),
      child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                  width: MediaQuery.of(context).size.width * 0.25,
                  height:double.infinity,
                  fit: BoxFit.fitHeight,
                  imageUrl:
                      'https://image.tmdb.org/t/p/original${widget.result.posterPath}',
                  placeholder: (context, url) => Center(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: MoviesAppTheme.musturedColor,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.result.title}",
                      style: MoviesAppTheme.moviesAppTheme.textTheme.titleSmall
                          ?.copyWith(color: MoviesAppTheme.whiteColor),
                    ),
                    Text(
                      "${widget.result.releaseDate!}",
                     // "${DateFormat('yyyy').format(DateTime.parse(widget.result.releaseDate!))}",
                      style: MoviesAppTheme.moviesAppTheme.textTheme.titleSmall
                          ?.copyWith(color: MoviesAppTheme.whiteColor),
                    ),
                  ],
                ),
              )
            ],
          )
    );
  }
}
