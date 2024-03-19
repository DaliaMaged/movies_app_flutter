import 'package:flutter/material.dart';
import 'package:movies_app/Models/MovieDetailsResponse.dart';

import '../api-constants/api-manager.dart';

class MovieDetailsViewmodel extends ChangeNotifier{
  MovieDetailsResponse? movieDetailsResponse;
  String? errorMessage;
  void getMovieDetails({required String movie_id}) async{
    movieDetailsResponse = null;
    errorMessage = null;
    try{
      var response = await ApiManager.getMovieDetails(movie_id: movie_id);
      if(response!=null){
        movieDetailsResponse = response!;
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