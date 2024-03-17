import 'package:movies_app/api-constants/ApiConstants.dart';

import '../Models/PopularMovies.dart';

class ApiManager{
  static Future<PopularMovies> getPopularMovies (){
    var url = Uri.https(ApiConstants.baseUrl,ApiConstants.popularEP,{
      "Authorization" : ApiConstants.apiToken
    });
   try{
     var responseJson =
   }
  }
}