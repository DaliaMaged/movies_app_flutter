import 'package:movies_app/Models/DiscoverResponse.dart';
import 'package:movies_app/Models/GenersResponse.dart';

abstract class CategoriesStates{
}
class CategoriesInitState extends CategoriesStates{

}
class CategoriesLoadingState extends CategoriesStates{
  bool? isLoading;
  CategoriesLoadingState({required this.isLoading});
}
class CategoriesSuccessState extends CategoriesStates{
  GenersResponse? genresResponse;
  CategoriesSuccessState({required this.genresResponse});
}
class CategoriesSuccessMoviesState extends CategoriesStates{
  DiscoverResponse? discoverResponse;
  CategoriesSuccessMoviesState({required this.discoverResponse});
}
class CategoriesFailureState extends CategoriesStates{
  String? message;
  CategoriesFailureState({required this.message});
}