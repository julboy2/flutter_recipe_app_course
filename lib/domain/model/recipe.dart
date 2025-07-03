import 'package:flutter_recipe_app_course/domain/model/recipe_ingredient.dart';

// 해당 클래스를 만들기 귀찮기 때문에
// freezed 를 사용하면 된다.
/*
class Recipe {
  final int id;
  final String category;
  final String name;
  final String image;
  final String chef;
  final String time;
  final double rating;
  final List<RecipeIngredient> ingredients;
  final bool isFavorite;

  Recipe({
    required this.id,
    required this.category,
    required this.name,
    required this.image,
    required this.chef,
    required this.time,
    required this.rating,
    required this.ingredients,
    this.isFavorite = false,
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
      isFavorite: (json["isFavorite"] as bool?) ?? false,
      ingredients:
          (json['ingredients'] as List<dynamic>?)
              ?.map(
                (item) =>
                    RecipeIngredient.fromJson(item as Map<String, dynamic>),
              )
              .toList() ??
          [],
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
      "isFavorite": isFavorite,
      'ingredients': ingredients.map((item) => item.toJson()).toList(),
    };
  }

  @override
  String toString() {
    return 'Recipe{id: $id, category: $category, name: $name, image: $image, chef: $chef, time: $time, rating: $rating, ingredients: $ingredients, isFavorite: $isFavorite}';
  }
}

// 전체 레시피 컬렉션을 담는 모델 클래스
class RecipeCollection {
  final List<Recipe> recipes;

  RecipeCollection({required this.recipes});

  factory RecipeCollection.fromJson(Map<String, dynamic> json) {
    return RecipeCollection(
      recipes: (json['recipes'] as List<dynamic>)
          .map((item) => Recipe.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'recipes': recipes.map((recipe) => recipe.toJson()).toList()};
  }

  @override
  String toString() {
    return 'RecipeCollection(recipes: $recipes)';
  }
}
*/

import 'recipe_ingredient.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';

part 'recipe.g.dart';

// ignore_for_file: annotate_overrides
@freezed
@JsonSerializable() // fromJson 추가시 꼭 명시적으로 적어줘야됨 3.x 부터
class Recipe with _$Recipe {
  // const factory Recipe({
  //   required String category,
  //   required int id,
  //   required String name,
  //   required String image,
  //   required String chef,
  //   required String time,
  //   required double rating,
  //   required List<RecipeIngredient> ingredients,
  //   @Default(false) bool isFavorite,
  // }) = _Recipe;

  final String category;
  final int id;
  final String name;
  final String image;
  final String chef;
  final String time;
  final double rating;
  final List<RecipeIngredient> ingredients;
  final bool isFavorite;

  const Recipe({
    this.category = "",
    this.id = 0,
    this.name = "",
    this.image = "",
    this.chef = "",
    this.time = "",
    this.rating = 0,
    this.ingredients = const [],
    this.isFavorite = false,
  });

  factory Recipe.fromJson(Map<String, Object?> json) => _$RecipeFromJson(json);

  // Map<String, dynamic> toJson() {
  //   // TODO: implement toJson
  //   throw UnimplementedError();
  // }

  Map<String, Object?> toJson() => _$RecipeToJson(this);
}
