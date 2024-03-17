import 'package:flutter/material.dart';

class WatchlistScreen extends StatefulWidget {
  static String screenTitle = "watchlist";

  @override
  State<WatchlistScreen> createState() => _WatchlistScreenState();
}

class _WatchlistScreenState extends State<WatchlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Text("watchlist",style: Theme.of(context).textTheme.titleLarge,);
  }
}
