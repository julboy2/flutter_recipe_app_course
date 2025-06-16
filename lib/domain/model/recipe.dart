
import 'package:flutter_recipe_app_course/domain/model/recipe_ingredient.dart';

class Recipe {
  final int id;
  final String category;
  final String name;
  final String image;
  final String chef;
  final String time;
  final double rating;
  final List<RecipeIngredient> ingredients;

  Recipe({
    required this.id,
    required this.category,
    required this.name,
    required this.image,
    required this.chef,
    required this.time,
    required this.rating,
    required this.ingredients,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'] as int,
      category: json['category'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      chef: json['chef'] as String,
      time: json['time'] as String,
      rating: (json['rating'] as num).toDouble(),
      ingredients: (json['ingredients'] as List<dynamic>?)
          ?.map((item) => RecipeIngredient.fromJson(item as Map<String, dynamic>))
          .toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category': category,
      'name': name,
      'image': image,
      'chef': chef,
      'time': time,
      'rating': rating,
      'ingredients': ingredients.map((item) => item.toJson()).toList(),
    };
  }

  @override
  String toString() {
    return 'Recipe(id: $id, category: $category, name: $name, chef: $chef, time: $time, rating: $rating, ingredients: $ingredients)';
  }
}

// 전체 레시피 컬렉션을 담는 모델 클래스
class RecipeCollection {
  final List<Recipe> recipes;

  RecipeCollection({
    required this.recipes,
  });

  factory RecipeCollection.fromJson(Map<String, dynamic> json) {
    return RecipeCollection(
      recipes: (json['recipes'] as List<dynamic>)
          .map((item) => Recipe.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'recipes': recipes.map((recipe) => recipe.toJson()).toList(),
    };
  }

  @override
  String toString() {
    return 'RecipeCollection(recipes: $recipes)';
  }
}
