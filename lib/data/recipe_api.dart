import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_herexamen_noah2023/models/recipe.dart';

class RecipeApi {
  static const String baseUrl = 'www.themealdb.com';
  static const String apiKey = 'YOUR_API_KEY'; // Replace with your actual API key

  Future<List<Recipe>> fetchRecipesByLetter(String letter) async {
    final url = Uri.https(baseUrl, '/api/json/v1/1/search.php', {'f': letter});
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final recipes = data['meals'] as List<dynamic>;

      return recipes.map<Recipe>((recipe) => Recipe.fromJson(recipe)).toList();    } else {
      throw Exception('Failed to fetch recipes');
    }
  }

  Future<Recipe> fetchRecipeById(String id) async {
    final url = Uri.https(baseUrl, '/api/json/v1/1/lookup.php', {'i': id});
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final recipe = data['meals'][0];

      return Recipe.fromJson(recipe);
    } else {
      throw Exception('Failed to fetch recipe');
    }
  }
}
