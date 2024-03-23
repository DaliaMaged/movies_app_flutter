import 'dart:convert';
import 'dart:io';

import 'package:movies_app/Models/MovieDetailsResponse.dart';
import 'package:movies_app/Models/SearchResponse.dart';
import 'package:movies_app/Models/SimilarMovies.dart';
import 'package:movies_app/Models/Topratedresponse.dart';
import 'package:movies_app/Models/UpComingResponse.dart';
import 'package:movies_app/api-constants/ApiConstants.dart';

import '../Models/PopularMovies.dart';
import 'package:http/http.dart' as http;

class ApiManager{
  static Future<PopularMovies> getPopularMovies () async {
    var url = Uri.https(ApiConstants.baseUrl,ApiConstants.popularEP,{
      "language":"en-US",
      "page":"1"
    });
   try{
     var responseString = await http.get(url,headers: {
       HttpHeaders.authorizationHeader:ApiConstants.apiToken
     });
     var responseFromJson = jsonDecode(responseString.body);
     return PopularMovies.fromJson(responseFromJson);
   }catch(e){
     throw e;
   }
  }
  static Future<UpComingResponse> getUpcomingMovies () async {
    var url = Uri.https(ApiConstants.baseUrl,ApiConstants.upcomingEP,{
      "language":"en-US",
      "page":"1"
    });
   try{
     var responseString = await http.get(url,headers: {
       HttpHeaders.authorizationHeader:ApiConstants.apiToken
     });
     var responseFromJson = jsonDecode(responseString.body);
     return UpComingResponse.fromJson(responseFromJson);
   }catch(e){
     print("$e");
     throw e;
   }
  }
  static Future<Topratedresponse> getRecommendedMovies () async {
    var url = Uri.https(ApiConstants.baseUrl,ApiConstants.topRatedEP,{
      "language":"en-US",
      "page":"1"
    });
   try{
     var responseString = await http.get(url,headers: {
       HttpHeaders.authorizationHeader:ApiConstants.apiToken
     });
     var responseFromJson = jsonDecode(responseString.body);
     return Topratedresponse.fromJson(responseFromJson);
   }catch(e){
     print("$e");
     throw e;
   }
  }
  static Future<SearchResponse> getSearchMovies (String? query) async {
    var url = Uri.https(ApiConstants.baseUrl,ApiConstants.searchMoviesEP,{
      "query":"$query",
      "language":"en-US",
      "page":"1",
      "include_adult":"true"
    });
   try{
     print(url);
     var responseString = await http.get(url,headers: {
       HttpHeaders.authorizationHeader:ApiConstants.apiToken
     });
     print(responseString.body);
     var responseFromJson = jsonDecode(responseString.body);
     return SearchResponse.fromJson(responseFromJson);
   }catch(e){
     print("$e");
     throw e;
   }
  }
  static Future<MovieDetailsResponse> getMovieDetails ({required String movie_id}) async {
    var url = Uri.https(ApiConstants.baseUrl,"${ApiConstants.movieDetailsEP}${movie_id}",{
      "language":"en-US",
      "page":"1"
    });
   try{
     print("api mnger dettt");
     var responseString = await http.get(url,headers: {
       HttpHeaders.authorizationHeader:ApiConstants.apiToken
     });
     var responseFromJson = jsonDecode(responseString.body);
     return MovieDetailsResponse.fromJson(responseFromJson);
   }catch(e){
     print("$e");
     throw e;
   }
  }
  static Future<SimilarMovies> getMovieSimilar ({required String movie_id}) async {
    var url = Uri.https(ApiConstants.baseUrl,"${ApiConstants.movieDetailsEP}${movie_id}/similar",{
      "language":"en-US",
      "page":"1"
    });
    print(url);
   try{
     print("api mnger dettt");
     var responseString = await http.get(url,headers: {
       HttpHeaders.authorizationHeader:ApiConstants.apiToken
     });
     var responseFromJson = jsonDecode(responseString.body);
     return SimilarMovies.fromJson(responseFromJson);
   }catch(e){
     print("$e");
     throw e;
   }
  }
}