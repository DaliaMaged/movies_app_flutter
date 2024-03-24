import 'package:bloc/bloc.dart';
import 'package:movies_app/api-constants/api-manager.dart';
import 'package:movies_app/browse/CategoriesStates.dart';

class CategoriesViewmodel extends Cubit<CategoriesStates>{
  CategoriesViewmodel():super(CategoriesInitState()){

  }
  var genreid = "";
  getGenres() async{
    emit(CategoriesLoadingState(isLoading: true));
    var response = await ApiManager.getGenres();
    if(response.genres!=null) {
      emit(CategoriesSuccessState(genresResponse: response));
    }
  }
  getMoviesByGenre() async{
    emit(CategoriesLoadingState(isLoading: true));
    var response = await ApiManager.getMoviesByGenre(genre_id: genreid.toString());
    emit(CategoriesSuccessMoviesState(discoverResponse: response));
  }
}