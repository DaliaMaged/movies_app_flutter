import 'package:flutter/material.dart';

class BrowseScreen extends StatefulWidget {
  static String screenTitle = "browseScreen";

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  @override
  Widget build(BuildContext context) {
    return Text("browser",style: Theme.of(context).textTheme.titleLarge,);
  }
}
