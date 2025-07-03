import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/core/domain/error/network_error.dart';
import 'package:flutter_recipe_app_course/core/domain/error/result.dart';
import 'package:flutter_recipe_app_course/domain/error/bookmark_error.dart';
import 'package:flutter_recipe_app_course/domain/error/new_recipe_error.dart';
import 'package:flutter_recipe_app_course/domain/model/recipe.dart';
import 'package:flutter_recipe_app_course/domain/use_case/get_dishes_by_category_use_case.dart';
import 'package:flutter_recipe_app_course/domain/use_case/get_new_recipes_use_case.dart';
import 'package:flutter_recipe_app_course/domain/use_case/toogle_bookmark_recipe_use_case.dart';
import 'package:flutter_recipe_app_course/presentation/home/home_state.dart';

import '../../domain/use_case/get_categories_use_case.dart';
import 'home_action.dart';

class HomeViewModel with ChangeNotifier {
  final GetCategoriesUseCase _getCategoriesUseCase;
  final GetDishesByCategoryUseCase _getDishesByCategoryUseCase;
  final GetNewRecipesUseCase _getNewRecipesUseCase;
  final ToggleBookmarkRecipeUseCase _toggleBookmarkRecipeUseCase;
  StreamSubscription? _streamSubscription;

  // 해당 에러는 단발성으로 처리
  // 지속적 에러는 상태 관리로 처리하는게 좋다
  final _eventController = StreamController<NetworkError>();
  Stream<NetworkError> get eventStream => _eventController.stream;

  // HomeViewModel.name(this._getCategoriesUseCase);
  HomeViewModel({
    required GetCategoriesUseCase getCategoriesUseCase,
    required GetDishesByCategoryUseCase getDishesByCategoryUseCase,
    required GetNewRecipesUseCase getNewRecipesUseCase,
    required ToggleBookmarkRecipeUseCase toggleBookmarkRecipeUseCase,
  }) : _getCategoriesUseCase = getCategoriesUseCase,
       _getDishesByCategoryUseCase = getDishesByCategoryUseCase,
      _getNewRecipesUseCase = getNewRecipesUseCase,
      _toggleBookmarkRecipeUseCase = toggleBookmarkRecipeUseCase
  {
    _fetchCategories();
    _fetchNewRecipes();
  }

  HomeState _state = const HomeState(name: "Jega");

  HomeState get state => _state;

  void _fetchCategories() async {
    final result = await _getCategoriesUseCase.execute();

    switch(result){
      case ResultSuccess<List<String>, NetworkError>():
        _state = state.copyWith(
          categories: result.data,
          selectedCategory: "All",
        );
        notifyListeners();

        await _fetchDishesByCategory("All");
        notifyListeners();
      case ResultError<List<String>, NetworkError>():
        // 모든 에러처리를 다하려면 또 switch 로 하나씩 적어준다.
        switch(result.error){
          case NetworkError.requestTimeout:
          case NetworkError.noInternet:
          case NetworkError.serverError:
          case NetworkError.unknown:
        }
        _eventController.add(result.error);
    }

  }

  Future<void> _fetchDishesByCategory(String category) async{
    // final dishes = await _getDishesByCategoryUseCase.execute(category);
    _streamSubscription = _getDishesByCategoryUseCase.execute(category).listen((dishes){
      _state = state.copyWith(dishes: dishes);
      notifyListeners();
    });
  }

  Future<void> _fetchNewRecipes() async {
    final result = await _getNewRecipesUseCase.execute();

    switch(result) {
      case ResultSuccess<List<Recipe>, NewRecipeError>():
        _state = state.copyWith(newRecipes: result.data);
        notifyListeners();
      case ResultError<List<Recipe>, NewRecipeError>():
        switch(result.error){
          case NewRecipeError.noRecipe:
          case NewRecipeError.invalidCategory:
          case NewRecipeError.unknown:
        }
    }
  }

  void _onSelectCategory(String category) async {
    _state = state.copyWith(selectedCategory: category);
    notifyListeners();

    await _fetchDishesByCategory(category);
  }

  void _onTapFavorite(Recipe recipe) async{
    final result = await _toggleBookmarkRecipeUseCase.execute(recipe.id);
    switch(result){
      case ResultSuccess<List<Recipe>, BookmarkError>():
        _state = state.copyWith(dishes: result.data);
        notifyListeners();
      case ResultError<List<Recipe>, BookmarkError>():
        switch(result.error){

          case BookmarkError.notFound:
            // TODO: Handle this case.
            throw UnimplementedError();
          case BookmarkError.saveFailed:
            // TODO: Handle this case.
            throw UnimplementedError();
          case BookmarkError.unknown:
            // TODO: Handle this case.
            throw UnimplementedError();
        }
    }
  }

  void onAction(HomeAction action) async{
    switch(action){
      case OnTapSearchField():
        return;
      case OnSelectCategory():
        _onSelectCategory(action.category);
      case OnTapFavorite():
        _onTapFavorite(action.recipe);
    }
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    super.dispose();
  }

}
