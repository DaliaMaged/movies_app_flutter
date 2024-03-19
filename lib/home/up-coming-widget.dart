import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/Models/UpComingResponse.dart';
import 'package:movies_app/MoviesAppTheme.dart';

class UpComingWidget extends StatefulWidget {
  UpCompingResults result;
  UpComingWidget({required this.result});

  @override
  State<UpComingWidget> createState() => _UpComingWidgetState();
}

class _UpComingWidgetState extends State<UpComingWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.25,
      height: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 8,horizontal: 3),
      child: Stack(
        children: [
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
        ],
      ),
    ) ;
  }
}
