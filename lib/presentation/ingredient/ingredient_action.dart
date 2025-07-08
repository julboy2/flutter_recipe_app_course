
import 'package:flutter_recipe_app_course/domain/model/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient_action.freezed.dart';

@freezed
sealed class IngredientAction with _$IngredientAction {
  const factory IngredientAction.onTapFavorite(Recipe recipe) = OnTapFavorite;
  const factory IngredientAction.onTapIngredient() = OnTapIngredient;
  const factory IngredientAction.onTapProcedure() = OnTapProcedure;
  const factory IngredientAction.onTapFollow(Recipe recipe) = OnTapFollow;
  const factory IngredientAction.loadRecipe(int recipeId) = LoadRecipe;
  const factory IngredientAction.onTapShareMenu(Recipe recipe) = OnTapShareMenu;
  const factory IngredientAction.onTapRateRecipe(Recipe recipe) = OnTapRateRecipe;
  const factory IngredientAction.onTapReview(Recipe recipe) = OnTapReview;
  const factory IngredientAction.onTapUnsave(Recipe recipe) = onTapUnsave;
}