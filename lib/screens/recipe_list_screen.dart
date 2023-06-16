import 'package:flutter/material.dart';
import 'package:flutter_herexamen_noah2023/models/recipe.dart';

class RecipeListScreen extends StatefulWidget {
  @override
  _RecipeListScreenState createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  List<Recipe> recipes = [
    Recipe(
      id: '1',
      name: 'Recipe 1',
      category: 'Category 1',
      area: 'Area 1',
      instructions: 'Instructions 1',
      thumbnailUrl: 'thumbnail_url_1',
      ingredients: ['Ingredient 1', 'Ingredient 2'],
    ),
    Recipe(
      id: '2',
      name: 'Recipe 2',
      category: 'Category 2',
      area: 'Area 2',
      instructions: 'Instructions 2',
      thumbnailUrl: 'thumbnail_url_2',
      ingredients: ['Ingredient 3', 'Ingredient 4'],
    ),
    Recipe(
      id: '3',
      name: 'Recipe 3',
      category: 'Category 3',
      area: 'Area 3',
      instructions: 'Instructions 3',
      thumbnailUrl: 'thumbnail_url_3',
      ingredients: ['Ingredient 5', 'Ingredient 6'],
    ),
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
            title: Text(recipes[index].name),
            subtitle: Text(recipes[index].getDescription()),
          );
        },
      ),
    );
  }
}
