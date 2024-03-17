import 'package:flutter/material.dart';
import 'package:movies_app/MoviesAppTheme.dart';
import 'package:movies_app/browse/browse_screen.dart';
import 'package:movies_app/home/home_screen.dart';
import 'package:movies_app/search/search_screen.dart';
import 'package:movies_app/watchlist/watchlist_screen.dart';

class InitScreen extends StatefulWidget {
  static String screenTitle = "initScreen";

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(canvasColor: MoviesAppTheme.bottomNavGreyColor),
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (int) {
            selectedIndex = int;
            setState(() {

            });
          },
          items: [
            BottomNavigationBarItem(
                icon: selectedIndex==0 ? Image.asset("assets/selectedImgs/selected_home_ic.png")
                : Image.asset("assets/unselectedImgs/home_ic.png")
                , label: "HOME"),
            BottomNavigationBarItem(
                icon: selectedIndex==1 ? Image.asset("assets/selectedImgs/selected_search_ic.png")
                    : Image.asset("assets/unselectedImgs/search_ic.png"),
                label: "SEARCH"),
            BottomNavigationBarItem(
                icon: selectedIndex==2 ? Image.asset("assets/selectedImgs/selected_browse_ic.png")
                    : Image.asset("assets/unselectedImgs/browser_ic.png"),
                label: "BROWSE"),
            BottomNavigationBarItem(
                icon:selectedIndex==3 ? Image.asset("assets/selectedImgs/selected_watchlist_ic.png")
                    : Image.asset("assets/unselectedImgs/watchlist_ic.png"),
                label: "WATCHLIST"),
          ],
        ),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
          child: screens[selectedIndex]),
    );
  }

  List<Widget> screens = [
    HomeScreen(),
    SearchScreen(),
    BrowseScreen(),
    WatchlistScreen()
  ];
}
