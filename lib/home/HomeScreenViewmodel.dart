import 'package:flutter/material.dart';
import 'package:movies_app/Models/Topratedresponse.dart';
import 'package:movies_app/Models/UpComingResponse.dart';
import 'package:movies_app/api-constants/api-manager.dart';

import '../Models/PopularMovies.dart';

class HomeScreenViewmodel extends ChangeNotifier{
   PopularMovies? popMovies;
   UpComingResponse? upcomingMovies;
   Topratedresponse? topratedresponse;
   String? errorMessage;
  void getPopMovies() async{
    popMovies = null;
    errorMessage = null;
    try{
      var response = await ApiManager.getPopularMovies();
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
    upcomingMovies = null;
    errorMessage = null;
    try{
      print("uppppppp");
      var response = await ApiManager.getUpcomingMovies();
      if(response.results!=null){
        upcomingMovies = response!;
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