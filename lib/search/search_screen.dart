import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/MoviesAppTheme.dart';
import 'package:movies_app/search/SearchStates.dart';
import 'package:movies_app/search/search-result-widget.dart';
import 'package:movies_app/search/searchViewmodel.dart';

class SearchScreen extends StatefulWidget {
  static String screenTitle = "searchScreen";

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  var viewmodel = SearchViewmodel();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => viewmodel,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: TextField(
              style: MoviesAppTheme
                  .moviesAppTheme.textTheme.titleMedium,
              controller: viewmodel.controller,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                  prefixIcon: InkWell(
                      onTap: () {
                        viewmodel.getSearchResults();
                      },
                      child: Icon(
                        Icons.search,
                        color: MoviesAppTheme.whiteColor,
                      )),
                  suffixIcon: Icon(
                    Icons.clear,
                    color: MoviesAppTheme.whiteColor,
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                          width: 2,
                          color: MoviesAppTheme.lightGreyColor_contentText)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                          color: MoviesAppTheme.lightGreyColor_contentText)),
                  hintText: "Enter movie name",
                  hintStyle: MoviesAppTheme.moviesAppTheme.textTheme.titleMedium
                      ?.copyWith(
                          color: MoviesAppTheme.lightGreyColor_contentText),
                  labelStyle: MoviesAppTheme
                      .moviesAppTheme.textTheme.titleMedium
                      ?.copyWith(color: MoviesAppTheme.whiteColor)),
            ),
          ),
          BlocBuilder<SearchViewmodel, SearchStates>(
            builder: (context, state) {
              if (state is SearchSuccessState) {
                return Expanded(
                    child: ListView.builder(
                      itemCount: state.searchResponse!.results!.length,
                        itemBuilder: (context, index) => SearchResultsWidget(
                          result: state.searchResponse!.results![index])));
              } else if (state is SearchLoadingState) {
                return Center(
                  child: CircularProgressIndicator(
                    color: MoviesAppTheme.musturedColor,
                  ),
                );
              } else if (state is SearchLoadingState) {
                return Center(
                  child: Image.asset("aassets/others/nomovies_ic.png"),
                );
              }
              return Center(child: Image.asset("assets/others/nomovies_ic.png"));
            },
            bloc: viewmodel,
          )
        ],
      ),
    );
  }
}
