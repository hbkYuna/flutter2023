import 'package:flutter/material.dart';
import 'package:flutter_herexamen_noah2023/models/recipe.dart';

class RecipeDetailScreen extends StatelessWidget {
  final Recipe recipe;

  RecipeDetailScreen({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe Details'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(recipe.thumbnailUrl),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recipe.name,
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Category: ${recipe.category}',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Area: ${recipe.area}',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Ingredients:',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                Column(
                  children: recipe.ingredients.map((ingredient) {
                    return Text('- $ingredient');
                  }).toList(),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Instructions:',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text(recipe.instructions),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
