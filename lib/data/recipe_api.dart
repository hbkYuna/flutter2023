import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_herexamen_noah2023/models/recipe.dart';

class RecipeAPI {
  static const String apiKey = '1';

  static Future<List<Recipe>> getRecipesByCategory(String category) async {
    final url = Uri.parse('https://www.themealdb.com/api/json/v1/$apiKey/filter.php?c=$category');

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> meals = data['meals'];

      return meals.map((meal) => Recipe.fromJson(meal)).toList();
    } else {
      throw Exception('Failed to get recipes by category');
    }
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
