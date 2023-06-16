class Recipe {
  final String id;
  final String name;
  final String category;
  final String area;
  final String instructions;
  final String thumbnailUrl;
  final List<String> ingredients;

  Recipe({
    required this.id,
    required this.name,
    required this.category,
    required this.area,
    required this.instructions,
    required this.thumbnailUrl,
    required this.ingredients,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['idMeal'],
      name: json['strMeal'],
      category: json['strCategory'],
      area: json['strArea'],
      instructions: json['strInstructions'],
      thumbnailUrl: json['strMealThumb'],
      ingredients: _extractIngredients(json),
    );
  }

  static List<String> _extractIngredients(Map<String, dynamic> json) {
    final ingredients = <String>[];
    for (int i = 1; i <= 20; i++) {
      final ingredientKey = 'strIngredient$i';
      final measureKey = 'strMeasure$i';
      final ingredient = json[ingredientKey] as String?;
      final measure = json[measureKey] as String?;
      if (ingredient != null && ingredient.isNotEmpty) {
        final ingredientWithMeasure =
            measure != null && measure.isNotEmpty ? '$measure $ingredient' : ingredient;
        ingredients.add(ingredientWithMeasure);
      } else {
        break;
      }
    }
    return ingredients;
  }

  String getDescription() {
    return "This meal originates from $area and goes by the name of $name";
  }
}
