import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movies_app/MoviesAppTheme.dart';
import 'package:movies_app/home/HomeScreenViewmodel.dart';
import 'package:movies_app/home/recommended-widget.dart';
import 'package:movies_app/home/up-coming-widget.dart';
import 'package:movies_app/movie-details/MovieDetailsScreen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static String screenTitle = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenViewmodel viewmodel = HomeScreenViewmodel();

  @override
  void initState() {
    super.initState();
    viewmodel.getPopMovies();
    viewmodel.getUpcomingMovies();
    viewmodel.getTopRatedMovies();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewmodel,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Consumer<HomeScreenViewmodel>(builder: (context, viewmodel, child) {
              if (viewmodel.popMovies == null) {
                return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: MoviesAppTheme.musturedColor,
                  ),
                );
              } else if (viewmodel.errorMessage != null) {
                return Column(
                  children: [
                    Text(
                      "${viewmodel.errorMessage}",
                      style: MoviesAppTheme.moviesAppTheme.textTheme.titleMedium,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          viewmodel.getPopMovies();
                        },
                        child: Text(
                          "Try Again",
                          style:
                              MoviesAppTheme.moviesAppTheme.textTheme.titleMedium,
                        ))
                  ],
                );
              } else {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: CarouselSlider(
                    items: viewmodel.popMovies!.results!.map((index) {
                      return Builder(
                        builder: (BuildContext context) {
                          return InkWell(
                            onTap: (){
                              Navigator.pushNamed(context, MovieDetailsScreen.screenTitle,
                                  arguments: {
                                    'movie_id':'${index.id}'
                                  }
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.height * 0.25,
                                    child: CachedNetworkImage(
                                      width: double.infinity,
                                      fit: BoxFit.fitWidth,
                                      imageUrl:
                                          'https://image.tmdb.org/t/p/original${index.posterPath}',
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
                                ),
                                Text(
                                  "${index.title}",
                                  style: MoviesAppTheme
                                      .moviesAppTheme.textTheme.titleLarge,
                                ),
                                Text(
                                    "${DateFormat('yyyy').format(DateTime.parse(index.releaseDate!))}",
                                    style: MoviesAppTheme
                                        .moviesAppTheme.textTheme.titleMedium),
                              ],
                            ),
                          );
                        },
                      );
                    }).toList(),
                    options:
                        //carouselController: buttonCarouselController,
                        CarouselOptions(
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      // enlargeCenterPage: true,
                      // viewportFraction: 0.9,
                      // aspectRatio: 2.0,
                      initialPage: 1,
                    ),
                  ),
                );
              }
            }),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Text(
                "New Releases ",
                style: MoviesAppTheme.moviesAppTheme.textTheme.titleLarge,
              ),
            ),
            Consumer<HomeScreenViewmodel>(builder: (context, viewmodel, child) {
              if (viewmodel.upcomingMovies == null) {
                return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: MoviesAppTheme.musturedColor,
                  ),
                );
              } else if (viewmodel.errorMessage != null) {
                return Column(
                  children: [
                    Text(
                      "${viewmodel.errorMessage}",
                      style: MoviesAppTheme.moviesAppTheme.textTheme.titleMedium,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          viewmodel.getUpcomingMovies();
                        },
                        child: Text(
                          "Try Again",
                          style:
                              MoviesAppTheme.moviesAppTheme.textTheme.titleMedium,
                        ))
                  ],
                );
              } else {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  color: MoviesAppTheme.darkGreyColor,
                  child: ListView.builder(
                      itemBuilder: (context, index) => InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, MovieDetailsScreen.screenTitle,
                          arguments: {
                            "movie_id":"${viewmodel.upcomingMovies!.results![index].id}"
                          }
                          );
                        },
                        child: UpComingWidget(
                              result: viewmodel.upcomingMovies!.results![index],
                            ),
                      ),
                    itemCount: viewmodel.upcomingMovies!.results!.length,
                    scrollDirection: Axis.horizontal,
                  ),
                );
              }
            }),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Text(
                "Recommended",
                style: MoviesAppTheme.moviesAppTheme.textTheme.titleLarge,
              ),
            ),
            Consumer<HomeScreenViewmodel>(builder: (context, viewmodel, child) {
              if (viewmodel.topratedresponse == null) {
                return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: MoviesAppTheme.musturedColor,
                  ),
                );
              } else if (viewmodel.errorMessage != null) {
                return Column(
                  children: [
                    Text(
                      "${viewmodel.errorMessage}",
                      style: MoviesAppTheme.moviesAppTheme.textTheme.titleMedium,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          viewmodel.getTopRatedMovies();
                        },
                        child: Text(
                          "Try Again",
                          style:
                          MoviesAppTheme.moviesAppTheme.textTheme.titleMedium,
                        ))
                  ],
                );
              } else {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  color: MoviesAppTheme.darkGreyColor,
                  child: ListView.builder(
                    itemBuilder: (context, index) => InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, MovieDetailsScreen.screenTitle,
                            arguments: {
                              "movie_id":"${viewmodel.topratedresponse!.results![index].id}"
                            }
                        );
                      },
                      child: RecommendedWidget(
                        result: viewmodel.topratedresponse!.results![index],
                      ),
                    ),
                    itemCount: viewmodel.topratedresponse!.results!.length,
                    scrollDirection: Axis.horizontal,
                  ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
