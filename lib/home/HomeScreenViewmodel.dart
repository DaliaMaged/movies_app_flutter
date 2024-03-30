import 'package:flutter/material.dart';
import 'package:movies_app/Models/Topratedresponse.dart';
import 'package:movies_app/Models/UpComingResponse.dart';
import 'package:movies_app/api-constants/api-manager.dart';

import '../Models/PopularMovies.dart';

class HomeScreenViewmodel extends ChangeNotifier{
   PopularMovies? popMovies;
   List<PopularMoviesResults>? popMoviesList;
   List<PopularMoviesResults>? popMoviesListNew;
   //
   UpComingResponse? upcomingMoviesResponse;
   List<UpCompingResults>? upcomingMoviesList;
   List<UpCompingResults>? upcomingMoviesListNew;
   //
   Topratedresponse? topratedresponse;
   List<TopRatedResults>? topratedresponseList;
   List<TopRatedResults>? topratedresponseListNew;
   //

   String? errorMessage;
   var upComingPage = 1;
   var PopularMoviesPage = 1;
   var TopratedPage = 1;

  void getPopMovies() async{
    popMovies = null;
    errorMessage = null;
    try{
      var response = await ApiManager.getPopularMovies(page: PopularMoviesPage);
      if(response.results!=null){
        popMovies = response!;
      }else if(response.success!){
        errorMessage = response.status_message;
      }
    }catch (e){
      print(e);
      errorMessage = e.toString();
    }
    notifyListeners();
  }
  void getUpcomingMovies() async{
    upcomingMoviesResponse = null;
    errorMessage = null;
    try{
      print("uppppppp");
      var response = await ApiManager.getUpcomingMovies(page: upComingPage );
      if(response.results!=null){
        upComingPage++;
        upcomingMoviesResponse = response;
        upcomingMoviesListNew = upcomingMoviesResponse?.results;
        if(upcomingMoviesList==null){
          upcomingMoviesList = upcomingMoviesListNew;
        }else {
        upcomingMoviesList?.addAll(upcomingMoviesListNew!);}
      }else if(response.success!){
        errorMessage = response.status_message;
      }
    }catch (e){
      print(e);
      errorMessage = e.toString();
    }
    notifyListeners();
  }
  void getTopRatedMovies() async{
    topratedresponse = null;
    errorMessage = null;
    try{
      print("topppppp");
      var response = await ApiManager.getRecommendedMovies();
      if(response.results!=null){
        topratedresponse = response!;
      }else if(response.success!){
        errorMessage = response.status_message;
      }
    }catch (e){
      print(e);
      errorMessage = e.toString();
    }
    notifyListeners();
  }
}