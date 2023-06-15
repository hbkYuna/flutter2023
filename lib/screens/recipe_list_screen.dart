import 'package:flutter/material.dart';
import 'package:flutter_herexamen_noah2023/models/recipe.dart';

class RecipeListScreen extends StatefulWidget {
  @override
  _RecipeListScreenState createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  List<Recipe> recipes = [
    Recipe('Recipe 1', 'Description 1'),
    Recipe('Recipe 2', 'Description 2'),
    Recipe('Recipe 3', 'Description 3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes'),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(recipes[index].title),
            subtitle: Text(recipes[index].description),
          );
        },
      ),
    );
  }
}
