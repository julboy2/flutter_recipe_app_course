import 'package:flutter_recipe_app_course/domain/model/recipe.dart';
import 'package:flutter_recipe_app_course/domain/repository/bookmark_repository.dart';
import 'package:flutter_recipe_app_course/domain/repository/recipe_repository.dart';

class GetSavedRecipesUseCase {
  final RecipeRepository _recipeRepository;
  final BookmarkRepository _bookmarkRepository;

  //GetSavedRecipesUseCase(this._recipeRepository, this._bookmarkRepository);
  const GetSavedRecipesUseCase({
    required RecipeRepository recipeRepository,
    required BookmarkRepository bookmarkRepository,
  }) : _recipeRepository = recipeRepository,
       _bookmarkRepository = bookmarkRepository;


  Stream<List<Recipe>> execute() async* {
    final recipes = await _recipeRepository.getRecipes();

    await for(final ids in _bookmarkRepository.bookmarkIdsStream()){
      yield recipes.where((e) => ids.contains(e.id)).toList();
    }

  }

  // Future<List<Recipe>> execute() async {
  //   final ids = await _bookmarkRepository.getBookmarkIds();
  //   final recipes = await _recipeRepository.getRecipes();
  //
  //   return recipes.where((e) => ids.contains(e.id)).toList();
  // }
}
