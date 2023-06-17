import 'package:flutter/material.dart';
import 'package:flutter_herexamen_noah2023/screens/home_screen.dart';
import 'package:flutter_herexamen_noah2023/screens/recipe_list_screen.dart';
import 'package:flutter_herexamen_noah2023/screens/recipe_details_screen.dart';
import 'package:flutter_herexamen_noah2023/models/recipe.dart';

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
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/recipeDetail') {
          final recipe = settings.arguments as Recipe;
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return RecipeDetailScreen(recipe: recipe);
            },
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          );
        }
        return null;
      },
    );
  }
}
