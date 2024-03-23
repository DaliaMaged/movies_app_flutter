import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/api-constants/api-manager.dart';
import 'package:movies_app/search/SearchStates.dart';

class SearchViewmodel extends Cubit<SearchStates>{
  SearchViewmodel():super(SearchInitState());

  var controller = TextEditingController();
  getSearchResults() async{
    emit(SearchLoadingState(
      isLoading: true
    ));
  var response = await ApiManager.getSearchMovies(controller.text);
  if(response.success!=null){
    emit(SearchFailureState(
      message: response.status_message
    ));
  }else{
    emit(SearchSuccessState(
      searchResponse: response
    ));
  }
}
}