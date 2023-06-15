import 'package:flutter/material.dart';
import 'package:flutter_herexamen_noah2023/screens/home_screen.dart';
import 'package:flutter_herexamen_noah2023/screens/recipe_list_screen.dart';
import 'package:flutter_herexamen_noah2023/utils/constants.dart';

void main() {
  runApp(RecipeApp());
}

class RecipeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/recipe-list': (context) => RecipeListScreen(),
        // Define other routes for your screens here
      },
    );
  }
}