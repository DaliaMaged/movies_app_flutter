import 'package:movies_app/Models/SearchResponse.dart';

abstract class SearchStates{
SearchResponse? searchResponse;
bool? isLoading;
String? message;
}
class SearchInitState extends SearchStates{

}
class SearchLoadingState extends SearchStates{
  bool? isLoading;
SearchLoadingState({required this.isLoading});
}
class SearchSuccessState extends SearchStates{
  SearchResponse? searchResponse;
  SearchSuccessState({required this.searchResponse});
}
class SearchFailureState extends SearchStates{
  String? message;
  SearchFailureState({required this.message});
}