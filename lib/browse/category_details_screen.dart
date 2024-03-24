import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/browse/category-result-widget.dart';

import '../MoviesAppTheme.dart';
import 'CategoriesStates.dart';
import 'CategoriesViewmodel.dart';

class CategoryDetailsScreen extends StatefulWidget {
  static String screenTitle = "category-detail-Screen";
  @override
  State<CategoryDetailsScreen> createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {
  var viewmodel = CategoriesViewmodel();
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Map;
    viewmodel.genreid = args['genre_id'];
    viewmodel.getMoviesByGenre();
    return BlocProvider(create:(context) => viewmodel,
    child: BlocBuilder(
      bloc: viewmodel,
      builder: ( context, state) {
      if (state is CategoriesLoadingState) {
        return Center(
          child: CircularProgressIndicator(
            color: MoviesAppTheme.musturedColor,
          ),
        );
      } else if (state is CategoriesFailureState) {
        Center(
          child: Image.asset("assets/nomovies.png"),
        );
      } else if (state is CategoriesSuccessMoviesState) {
        return ListView.builder(
          itemBuilder: (context, index) => Container(
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: MoviesAppTheme.darkGreyColor,
                  borderRadius: BorderRadius.circular(15)),
              child:CategoryResultsWidget(result:
                state.discoverResponse!.results![index],

              ),
            ),
          itemCount: state.discoverResponse?.results?.length,
        );
      }
      return Container();
    },

    ) ,
    );
  }
}
