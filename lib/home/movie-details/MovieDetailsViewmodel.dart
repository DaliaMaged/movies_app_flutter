import 'package:flutter/material.dart';
import 'package:movies_app/Models/MovieDetailsResponse.dart';
import 'package:movies_app/Models/SimilarMovies.dart';

import '../../api-constants/api-manager.dart';


class MovieDetailsViewmodel extends ChangeNotifier{
  MovieDetailsResponse? movieDetailsResponse;
  SimilarMovies? similarMovies;
  String? errorMessageDetail;
  String? errorMessageSimilar;
  void getMovieDetails({required String movie_id}) async{
    movieDetailsResponse = null;
    errorMessageDetail = null;
    try{
      var response = await ApiManager.getMovieDetails(movie_id: movie_id);
      if(response!=null){
        movieDetailsResponse = response!;
      }else if(response.success!){
        errorMessageDetail = response.status_message;
      }
    }catch (e){
      errorMessageDetail = e.toString();
    }
    notifyListeners();
  }
  void getSimilarMovie({required String movie_id}) async{
    similarMovies = null;
    errorMessageSimilar = null;
    try{
      print("api viewmodel");

      var response = await ApiManager.getMovieSimilar(movie_id: movie_id);
      if(response!=null){
        similarMovies = response!;
      }else if(response.success!){
        errorMessageSimilar = response.status_message;
      }
    }catch (e){
      print("$e ******");
      errorMessageSimilar = e.toString();
    }
    notifyListeners();
  }
}