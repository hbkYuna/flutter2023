import 'package:flutter/material.dart';
import 'package:flutter_herexamen_noah2023/screens/home_screen.dart';
import 'package:flutter_herexamen_noah2023/screens/recipe_list_screen.dart';
import 'package:flutter_herexamen_noah2023/screens/recipe_details_screen.dart';
import 'package:flutter_herexamen_noah2023/models/recipe.dart';

void main() {
  runApp(RecipeApp());
}

class RecipeApp extends StatefulWidget {
  @override
  _RecipeAppState createState() => _RecipeAppState();
}

class _RecipeAppState extends State<RecipeApp> {
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    HomeScreen(),
    RecipeListScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Recipes',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
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
