/*
freezed 로 다시 만든다.
copyWith 같은 함수를 추가하려니 해당 관계있는 클래스를 다 수정해줘야되서 다시 freezed 로 만든다.

import 'ingredient.dart';

class RecipeIngredient {
  final Ingredient ingredient;
  final int amount;

  RecipeIngredient({
    required this.ingredient,
    required this.amount,
  });

  factory RecipeIngredient.fromJson(Map<String, dynamic> json) {
    return RecipeIngredient(
      ingredient: Ingredient.fromJson(json['ingredient'] as Map<String, dynamic>),
      amount: json['amount'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ingredient': ingredient.toJson(),
      'amount': amount,
    };
  }

  @override
  String toString() {
    return 'RecipeIngredient(ingredient: $ingredient, amount: $amount)';
  }
}

 */

import 'package:freezed_annotation/freezed_annotation.dart';

import 'ingredient.dart';

part "recipe_ingredient.freezed.dart";

part "recipe_ingredient.g.dart";

// ignore_for_file: annotate_overrides
@freezed
@JsonSerializable() // fromJson 추가시 꼭 명시적으로 적어줘야됨 3.x 부터
class RecipeIngredient with _$RecipeIngredient {

  final Ingredient ingredient;
  final int amount;

  const RecipeIngredient({required this.ingredient, this.amount = 0});

  factory RecipeIngredient.fromJson(Map<String, Object?> json) =>
      _$RecipeIngredientFromJson(json);


}
