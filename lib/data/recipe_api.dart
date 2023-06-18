import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_herexamen_noah2023/models/recipe.dart';

class RecipeAPI {
  static const String apiKey = '1';

  static Future<List<Recipe>> getRandomRecipes() async {
    final url = Uri.parse('https://www.themealdb.com/api/json/v1/$apiKey/random.php');

    final List<Recipe> recipes = [];
    for (int i = 0; i < 10; i++) {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> meals = data['meals'];

        if (meals.isNotEmpty) {
          final Recipe recipe = Recipe.fromJson(meals.first);
          recipes.add(recipe);
        } else {
          throw Exception('Recipe not found');
        }
      } else {
        throw Exception('Failed to get random recipe');
      }
    }

    return recipes;
  }

  static Future<Recipe> getRecipeById(String id) async {
    final url = Uri.parse('https://www.themealdb.com/api/json/v1/$apiKey/lookup.php?i=$id');

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> meals = data['meals'];

      if (meals.isNotEmpty) {
        return Recipe.fromJson(meals.first);
      } else {
        throw Exception('Recipe not found');
      }
    } else {
      throw Exception('Failed to get recipe by ID');
    }
  }
}
