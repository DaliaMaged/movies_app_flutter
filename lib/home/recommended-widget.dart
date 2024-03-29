import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:movies_app/Models/Topratedresponse.dart';
import 'package:movies_app/Models/watchlistModel.dart';
import 'package:movies_app/MoviesAppTheme.dart';
import 'package:movies_app/home/addToFavViewmodel.dart';

class RecommendedWidget extends StatefulWidget {
  TopRatedResults result;

  RecommendedWidget({required this.result});

  @override
  State<RecommendedWidget> createState() => _RecommendedWidgetState();
}

class _RecommendedWidgetState extends State<RecommendedWidget> {
  var viewmodel = AddToFavViewmodel();
@override
  void initState() {
    super.initState();
    viewmodel.check(WatchList(releaseDate: widget.result.releaseDate , title: widget.result.title , posterPath: widget.result.posterPath));
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => viewmodel,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.25,
        height: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 3),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                    imageUrl:
                        'https://image.tmdb.org/t/p/original${widget.result.posterPath}',
                    placeholder: (context, url) => Center(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: MoviesAppTheme.musturedColor,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                Row(
                  children: [
                    //Image.asset("assets/star_ic.png",width: MediaQuery.of(context).size.width*0.1,),
                    Icon(
                      Icons.star,
                      color: MoviesAppTheme.musturedColor,
                    ),
                    Text(
                      "${widget.result.voteAverage}",
                      style: MoviesAppTheme.moviesAppTheme.textTheme.titleSmall
                          ?.copyWith(color: MoviesAppTheme.whiteColor),
                    ),
                  ],
                ),
                Text(
                  "${widget.result.title}",
                  style: MoviesAppTheme.moviesAppTheme.textTheme.titleSmall
                      ?.copyWith(color: MoviesAppTheme.whiteColor),
                ),
                Text(
                  "${DateFormat('yyyy').format(DateTime.parse(widget.result.releaseDate!))}",
                  style: MoviesAppTheme.moviesAppTheme.textTheme.titleSmall
                      ?.copyWith(color: MoviesAppTheme.whiteColor),
                ),
              ],
            ),
                 BlocBuilder<AddToFavViewmodel, AddToFavState>(
                  bloc: viewmodel,
                  builder: (BuildContext context, state) {
                    if (state is AddToFavSuccess) {
                      toast(state.successMessage ?? "");
                      return Stack(
                        children: [
                          Image.asset(
                            "assets/others/save_ic.png",
                            color: MoviesAppTheme.musturedColor,
                          ),
                        Icon(Icons.check,color: MoviesAppTheme.whiteColor,)
                        ],
                      );
                    }
                    else if(state is AddToFavSaved){
                      return InkWell(
                        onTap: (){
                          viewmodel.addToFavShared(WatchList(
                              releaseDate: widget.result.releaseDate,
                              title: widget.result.title,
                              posterPath: widget.result.posterPath));
                        },
                        child: state.saved! ? Stack(
                          children: [
                            Image.asset(
                              "assets/others/save_ic.png",
                              color: MoviesAppTheme.musturedColor,
                            ),
                            Icon(Icons.check,color: MoviesAppTheme.whiteColor,)
                          ],
                        ) : Stack(
                          children: [
                            Image.asset(
                              "assets/others/save_ic.png",
                            ),
                             Icon(Icons.add,color: MoviesAppTheme.whiteColor,)
                          ],
                        ),
                      );
                    }
                    else {
                      return Stack(
                        children: [
                          // Image.asset(
                          //   "assets/others/save_ic.png",
                          // ),
                          //  Icon(Icons.add,color: MoviesAppTheme.whiteColor,)
                        ],
                      );
                    }
                  },
                )
          ],
        ),
      ),
    );
  }
/*
 Image.asset("assets/save_ic.png",
                    color: widget.isSaved
                        ? MoviesAppTheme.musturedColor
                        : MoviesAppTheme.lightGreyColor_contentText)
 */
toast(String message){
  Fluttertoast.showToast(
      msg: "$message",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: MoviesAppTheme.lightGreyColor_contentText,
      textColor: MoviesAppTheme.darkGreyColor,
      fontSize: 16.0
  );
}
}
