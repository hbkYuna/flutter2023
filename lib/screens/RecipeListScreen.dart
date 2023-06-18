import 'package:flutter/material.dart';
import 'package:flutter_herexamen_noah2023/models/recipe.dart';
import 'package:flutter_herexamen_noah2023/screens/RecipeDetailScreen.dart';
import 'package:flutter_herexamen_noah2023/data/recipe_api.dart';

class RecipeListScreen extends StatefulWidget {
  @override
  _RecipeListScreenState createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  List<Recipe> recipes = [];
  bool isLoading = true;

  String nameFilter = '';
  String? areaFilter;
  bool showFilters = false;

  @override
  void initState() {
    super.initState();
    fetchRandomRecipes();
  }

  void fetchRandomRecipes() async {
    try {
      setState(() {
        isLoading = true;
      });

      final List<Recipe> fetchedRecipes = await RecipeAPI.getRandomRecipes();
      setState(() {
        recipes = fetchedRecipes;
        isLoading = false;
      });
    } catch (e) {
      // Handle error
      print('Error fetching recipes: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes'),
      ),
      body: Column(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: showFilters ? 120.0 : 0.0,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
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
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: DropdownButtonFormField<String?>(
                          value: areaFilter,
                          decoration: InputDecoration(
                            labelText: 'Filter by Area',
                          ),
                          items: <String?>[
                            null,
                            'American',
                            'British',
                            'French',
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
                      ),
                    ],
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
            child: isLoading
                ? Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(16.0),
                    child: LinearProgressIndicator(
                      minHeight: 4.0,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.red), // Change the color here
                      backgroundColor: Colors.grey[300],
                    ),
                  )
                : ListView.builder(
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
                            subtitle: Text(recipe.area),
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
