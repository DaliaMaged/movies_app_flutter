import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:movies_app/Models/watchlistModel.dart';
import 'package:movies_app/firebase/firebase-utlis.dart';

class AddToFavViewmodel extends Cubit<AddToFavState> {
  AddToFavViewmodel() : super(AddToFavInit());

  addToFavShared(WatchList watchItemMovie) async {
    emit(AddToFavLoading(isloadig: true));
    var moviesBox = await Hive.openBox("movies-box");
    try{
      moviesBox.add(WatchList(
          releaseDate: watchItemMovie.releaseDate,
          title: watchItemMovie.title,
          posterPath: watchItemMovie.posterPath));
      emit(AddToFavSuccess(successMessage: "Movie added to watchlist"));
    }catch(e){
      emit(AddToFavFailure(failureMessage:"can't add this movie , please try again"));
    }
    }

}

class AddToFavState {}

class AddToFavSuccess extends AddToFavState {
  String? successMessage;

  AddToFavSuccess({required this.successMessage});
}

class AddToFavFailure extends AddToFavState {
  String? failureMessage;

  AddToFavFailure({required this.failureMessage});
}

class AddToFavInit extends AddToFavState {}

class AddToFavLoading extends AddToFavState {
  bool? isloadig;

  AddToFavLoading({required this.isloadig});
}
