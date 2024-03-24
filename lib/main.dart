import 'package:flutter/material.dart';
import 'package:movies_app/MoviesAppTheme.dart';
import 'package:movies_app/browse/categories_screen.dart';
import 'package:movies_app/browse/category_details_screen.dart';
import 'package:movies_app/home/home_screen.dart';
import 'package:movies_app/init_screen.dart';
import 'package:movies_app/search/search_screen.dart';
import 'package:movies_app/watchlist/watchlist_screen.dart';

import 'home/movie-details/MovieDetailsScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      theme:MoviesAppTheme.moviesAppTheme,
      debugShowCheckedModeBanner: false,
      home: InitScreen(),
      routes: {
        InitScreen.screenTitle : (context) => InitScreen(),
        SearchScreen.screenTitle : (context) => SearchScreen(),
        HomeScreen.screenTitle : (context) => HomeScreen(),
        CategoriesScreen.screenTitle : (context) => CategoriesScreen(),
        WatchlistScreen.screenTitle : (context) => WatchlistScreen(),
        MovieDetailsScreen.screenTitle : (context) => MovieDetailsScreen(),
        CategoryDetailsScreen.screenTitle : (context) => CategoryDetailsScreen(),
      },
    );
  }
}
