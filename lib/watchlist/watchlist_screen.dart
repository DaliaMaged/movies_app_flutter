import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:movies_app/Models/watchlistModel.dart';
import 'package:movies_app/MoviesAppTheme.dart';
import 'package:movies_app/watchlist/watchlist-widget.dart';

class WatchlistScreen extends StatefulWidget {
  static String screenTitle = "watchlist";

  @override
  State<WatchlistScreen> createState() => _WatchlistScreenState();
}

class _WatchlistScreenState extends State<WatchlistScreen> {
var list  = Hive.box<WatchList>("movies-box");
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12,horizontal: 8),
              child: list.isNotEmpty ? ListView.builder(
                  itemBuilder: (context, index) {
                    print( list.getAt(index)!.posterPath);
                    return WatchListWidget(result: list.getAt(index)!,
                    );
                  },
                itemCount: list.length,
              ) : Image.asset("assets/others/nomovies_ic.png"),
            )
        ),
      ],
    );
  }
  }
/*
*Column(
      children: [
        Expanded(
            child: ListView.builder(
            itemBuilder: (context, index) {
              WatchListWidget(result: boxList.getAt(index)!,
              );
            }
        )
        ),
      ],
    )
 */

