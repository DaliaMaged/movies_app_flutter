import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static String screenTitle = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Text("home",style: Theme.of(context).textTheme.titleLarge,);
  }
}
