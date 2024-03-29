import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:movies_app/Models/watchlistModel.dart';
import 'package:movies_app/firebase/firebase-utlis.dart';

class AddToFavViewmodel extends Cubit<AddToFavState> {
  AddToFavViewmodel() : super(AddToFavInit());
check(WatchList movie) {
  var moviesBox = Hive.box<WatchList>("movies-box");
 for(int i = 0 ; i < moviesBox.length ; i++) {
    if (movie.title == moviesBox.getAt(i)!.title!) {
      emit(AddToFavSaved(saved: true));
      return;
    } else {
      emit(AddToFavSaved(saved: false));
    }
  }
}
  addToFavShared(WatchList watchItemMovie) async {
    var moviesBox = Hive.box<WatchList>("movies-box");
    try {
      moviesBox.add(WatchList(
          releaseDate: watchItemMovie.releaseDate,
          title: watchItemMovie.title,
          posterPath: watchItemMovie.posterPath));
      emit(AddToFavSuccess(successMessage: "Movie added to watchlist"));
      //check();
    } catch (e) {
      emit(AddToFavFailure(
          failureMessage: "can't add this movie , please try again"));
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
class AddToFavSaved extends AddToFavState { 
  bool? saved;
  AddToFavSaved({required this.saved});
}

class AddToFavLoading extends AddToFavState {
  bool? isloadig;

  AddToFavLoading({required this.isloadig});
}
