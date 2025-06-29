import 'package:flutter_recipe_app_course/domain/model/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  @override
  final List<String> categories;
  @override
  final String selectedCategory;
  @override
  final List<Recipe> dishes;
  @override
  final List<Recipe> newRecipes;

  const HomeState({
    this.categories = const [],
    this.selectedCategory = "All",
    this.dishes = const [],
    this.newRecipes= const [],

  });

}
