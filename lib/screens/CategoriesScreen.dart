import 'package:flutter/material.dart';
import 'package:flutter_herexamen_noah2023/models/recipe.dart';
import 'package:flutter_herexamen_noah2023/screens/RecipeListScreen.dart';

class CategoriesScreen extends StatelessWidget {
  final List<String> categories = [
    'Appetizers',
    'Main Courses',
    'Desserts',
    'Drinks',
    'Snacks',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return ListTile(
            title: Text(category),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecipeListScreen(category: category),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
