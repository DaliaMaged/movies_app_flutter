import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies_app/Models/watchlistModel.dart';

class FirebaseManager{
  static Future<String> addMovie ({ required WatchList watchItemMovie }
      ) {
    CollectionReference movies = FirebaseFirestore.instance.collection('movies');

    return movies.add({
      WatchList(
        posterPath: watchItemMovie.posterPath,
        title: watchItemMovie.title,
        releaseDate: watchItemMovie.releaseDate
      )
    }).then((value) => "${watchItemMovie.title} added to watchList")
    .catchError((error) => "can't add ${watchItemMovie.title} , please try again");
  }
}