import 'dart:io';

import 'package:flutter_recipe_app_course/domain/repository/recipe_repository.dart';

import '../../core/domain/error/network_error.dart';
import '../../core/domain/error/result.dart';

class GetCategoriesUseCase {
  final RecipeRepository _recipeRepository;

  // GetCategoriesUseCase.name(this._recipeRepository);
  const GetCategoriesUseCase({
    required RecipeRepository recipeRepository,
  }) : _recipeRepository = recipeRepository;

  Future<Result<List<String>, NetworkError>> execute() async {
    try{
      final recipes = await _recipeRepository.getRecipes();
      return Result.success([
        "All",
        // 중복 제거위해 toSet 사용
        ...recipes.map((e) => e.category).toSet(),
      ]);
    } on SocketException {
      return const Result.error(NetworkError.noInternet);
    } catch(e){
      return const Result.error(NetworkError.unknown);
    }

  }

}