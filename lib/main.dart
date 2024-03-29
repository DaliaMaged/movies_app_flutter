import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:movies_app/MoviesAppTheme.dart';
import 'package:movies_app/browse/categories_screen.dart';
import 'package:movies_app/browse/category_details_screen.dart';
import 'package:movies_app/home/home_screen.dart';
import 'package:movies_app/init_screen.dart';
import 'package:movies_app/search/search_screen.dart';
import 'package:movies_app/watchlist/watchlist_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'Models/watchlistModel.dart';
import 'home/movie-details/MovieDetailsScreen.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final Directory dic = await getApplicationDocumentsDirectory();
   Hive.init(dic.path);
   Hive.registerAdapter<WatchList>(WatchListAdapter());
  await Hive.openBox<WatchList>("movies-box");
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});


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
