import 'package:flutter_recipe_app_course/domain/repository/recipe_repository.dart';

class GetCategoriesUseCase {
  final RecipeRepository _recipeRepository;

  // GetCategoriesUseCase.name(this._recipeRepository);
  const GetCategoriesUseCase({
    required RecipeRepository recipeRepository,
  }) : _recipeRepository = recipeRepository;

  Future<List<String>> execute() async {
    final recipes = await _recipeRepository.getRecipes();
    return [
      "All",
      // 중복 제거위해 toSet 사용
      ...recipes.map((e) => e.category).toSet(),
    ];
  }

}