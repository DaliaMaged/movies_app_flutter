import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movies_app/Models/UpComingResponse.dart';
import 'package:movies_app/Models/Topratedresponse.dart';
import 'package:movies_app/MoviesAppTheme.dart';

class RecommendedWidget extends StatefulWidget {
  TopRatedResults result;
  RecommendedWidget({required this.result});

  @override
  State<RecommendedWidget> createState() => _RecommendedWidgetState();
}

class _RecommendedWidgetState extends State<RecommendedWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.25,
      height: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 8,horizontal: 3),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
          children:[
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedNetworkImage(
                width: double.infinity,
                fit: BoxFit.fitWidth,
                imageUrl:
                'https://image.tmdb.org/t/p/original${widget.result.posterPath}',
                placeholder: (context, url) => Center(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: MoviesAppTheme.musturedColor,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) =>
                    Icon(Icons.error),
              ),
          ),
            Row(
              children: [
                //Image.asset("assets/star_ic.png",width: MediaQuery.of(context).size.width*0.1,),
                Icon(Icons.star,color: MoviesAppTheme.musturedColor,),
                Text(
                  "${widget.result.voteAverage}",
                  style:
                  MoviesAppTheme.moviesAppTheme.textTheme.titleSmall?.copyWith(
                    color: MoviesAppTheme.whiteColor
                  ),
                ),
              ],
            ),
            Text(
              "${widget.result.title}",
              style:
              MoviesAppTheme.moviesAppTheme.textTheme.titleSmall?.copyWith(
                  color: MoviesAppTheme.whiteColor
              ),
            ),Text(
              "${DateFormat('yyyy').format(DateTime.parse(widget.result.releaseDate!))}",
              style:
              MoviesAppTheme.moviesAppTheme.textTheme.titleSmall?.copyWith(
                  color: MoviesAppTheme.whiteColor
              ),
            ),
        ],
          )
        ],
      ),
    ) ;
  }
}
