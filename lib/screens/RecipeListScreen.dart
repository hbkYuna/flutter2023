import 'package:flutter/material.dart';
import 'package:flutter_herexamen_noah2023/models/recipe.dart';
import 'package:flutter_herexamen_noah2023/screens/RecipeDetailScreen.dart';

class RecipeListScreen extends StatefulWidget {
  final String category;

  RecipeListScreen({required this.category});

  @override
  _RecipeListScreenState createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  List<Recipe> recipes = [
    Recipe(
      id: '1',
      name: 'Recipe 1',
      category: 'Main Courses',
      area: 'Area 1',
      instructions: 'Instructions 1',
      thumbnailUrl: 'thumbnail_url_1',
      ingredients: ['Ingredient 1', 'Ingredient 2'],
    ),
    Recipe(
      id: '2',
      name: 'Recipe 2',
      category: 'Main Courses',
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

  String nameFilter = '';
  String? areaFilter;
  bool showFilters = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Filter by Name',
              ),
              onChanged: (value) {
                setState(() {
                  nameFilter = value;
                });
              },
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: showFilters ? 120.0 : 0.0,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  DropdownButtonFormField<String?>(
                    value: areaFilter,
                    decoration: InputDecoration(
                      labelText: 'Filter by Area',
                    ),
                    items: <String?>[
                      null,
                      'Area 1',
                      'Area 2',
                      'Area 3',
                    ].map<DropdownMenuItem<String?>>((String? value) {
                      return DropdownMenuItem<String?>(
                        value: value,
                        child: Text(value ?? 'All Areas'),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        areaFilter = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    showFilters = !showFilters;
                  });
                },
                child: Text(showFilters ? 'Hide Filters' : 'Show Filters'),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Expanded(
            child: ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                final recipe = recipes[index];
                if (recipe.name.toLowerCase().contains(nameFilter.toLowerCase()) &&
                    (areaFilter == null || recipe.area == areaFilter)) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) {
                            return RecipeDetailScreen(recipe: recipe);
                          },
                          transitionsBuilder: (context, animation, secondaryAnimation, child) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                    child: ListTile(
                      title: Text(recipe.name),
                      subtitle: Text(recipe.getDescription()),
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
