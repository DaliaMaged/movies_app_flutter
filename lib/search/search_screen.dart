import 'package:flutter/material.dart';
import 'package:movies_app/MoviesAppTheme.dart';

class SearchScreen extends StatefulWidget {
  static String screenTitle = "searchScreen";

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Text("search",style: Theme.of(context).textTheme.titleLarge,);
  }
}
