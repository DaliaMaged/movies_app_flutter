import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/browse/CategoriesStates.dart';
import 'package:movies_app/browse/CategoriesViewmodel.dart';
import 'package:movies_app/browse/category_details_screen.dart';

import '../MoviesAppTheme.dart';

class CategoriesScreen extends StatefulWidget {
  static String screenTitle = "browseScreen";

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  var viewmodel = CategoriesViewmodel();

  @override
  Widget build(BuildContext context) {
    print("////////");
    viewmodel.getGenres();
    return BlocProvider(
        create: (context) => viewmodel,
        child: BlocBuilder<CategoriesViewmodel, CategoriesStates>(
          bloc: viewmodel,
          builder: (context, state) {
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
            } else if (state is CategoriesSuccessState) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) => InkWell(
                  onTap:() {
                   // viewmodel.genreid = state.genresResponse?.genres![index].id.toString() ?? "";
                    Navigator.pushNamed(context, CategoryDetailsScreen.screenTitle,
                    arguments:
                        {"genre_id" : state.genresResponse?.genres![index].id.toString() ?? ""}
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: MoviesAppTheme.darkGreyColor,
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Text(
                        "${state.genresResponse?.genres?[index].name ?? ""}",
                        style: MoviesAppTheme.moviesAppTheme.textTheme.titleLarge
                            ?.copyWith(color: MoviesAppTheme.musturedColor),
                      ),
                    ),
                  ),
                ),
                itemCount: state.genresResponse?.genres?.length,
              );
            }
            return Container();
          },
        ));
  }
}
