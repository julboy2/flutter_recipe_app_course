
import 'package:flutter_recipe_app_course/domain/model/ingredient.dart';
import 'package:flutter_recipe_app_course/domain/model/procedure_entity.dart';
import 'package:flutter_recipe_app_course/domain/model/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient_state.freezed.dart';

part 'ingredient_state.g.dart';

// ignore_for_file: annotate_overrides
@freezed
@JsonSerializable() // fromJson 추가시 꼭 명시적으로 적어줘야됨 3.x 부터
class IngredientState with _$IngredientState {
  final Recipe? recipe;
  final List<Ingredient> ingredients;
  final List<ProcedureEntity> procedures;
  final int selectTabIndex;

  const IngredientState({
    this.recipe,
    this.ingredients = const [],
    this.procedures = const [],
    this.selectTabIndex = 0,
  });

  factory IngredientState.fromJson(Map<String ,Object?> json) =>
      _$IngredientStateFromJson(json);

}