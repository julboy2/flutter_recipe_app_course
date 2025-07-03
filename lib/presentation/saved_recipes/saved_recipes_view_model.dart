import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/core/domain/error/result.dart';
import 'package:flutter_recipe_app_course/domain/error/bookmark_error.dart';
import 'package:flutter_recipe_app_course/domain/model/recipe.dart';
import 'package:flutter_recipe_app_course/domain/use_case/toogle_bookmark_recipe_use_case.dart';
import 'package:flutter_recipe_app_course/presentation/saved_recipes/saved_recipes_action.dart';
import 'package:flutter_recipe_app_course/presentation/saved_recipes/saved_recipes_state.dart';

import '../../domain/use_case/get_saved_recipes_use_case.dart';

// MVVM 패턴
// 상태를 모니터링해서 화면이 알아서 UI 업데이트하는 컨셉 이 MVVM 패턴이다.
class SavedRecipesViewModel with ChangeNotifier {
  final GetSavedRecipesUseCase _getSavedRecipesUseCase;
  final ToggleBookmarkRecipeUseCase _toggleBookmarkRecipeUseCase;
  StreamSubscription? _streamSubscription;

  // 아래 2개의 ( _recipes , _isLoading) 상태값을 _state  하나로 만든다.
  SavedRecipesState _state = SavedRecipesState();

  SavedRecipesState get state => _state;

  /*
  // 상태
  List<Recipe> _recipes = [];
  // 외부에서 수정이 불가능하도록 unmodifiable 사용 하는게 국룰
  List<Recipe> get recipes => List.unmodifiable(_recipes);
  bool _isLoading = false;
  bool get isLoading => _isLoading;
 */

  // 소스에서는
  SavedRecipesViewModel({
    required GetSavedRecipesUseCase getSavedRecipesUseCase,
    required ToggleBookmarkRecipeUseCase toggleBookmarkRecipeUseCase,
  }) : _getSavedRecipesUseCase = getSavedRecipesUseCase ,
    _toggleBookmarkRecipeUseCase = toggleBookmarkRecipeUseCase {
    // _loadRecipeData();

    _streamSubscription = _getSavedRecipesUseCase.execute().listen((recipes) {
      _state = state.copyWith(
          recipes: recipes,
          // stream 으로 받기때문에 로딩이 의미가 없어졌다.
          // isLoading: false
      );
      // 상태업데이트
      notifyListeners();
    });
  }

  void _onTapFavorite(int recipeId) async {
    await _toggleBookmarkRecipeUseCase.execute(recipeId);

  }

  void onAction(SavedRecipesAction action) async {
    switch(action){
      case OnTapFavorite():
        _onTapFavorite(action.recipe.id);
      case OnTapRecipe():
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }

  void _loadRecipeData() async {
    // _state = state.copyWith(isLoading: true);
    // notifyListeners();
    //
    // _state = state.copyWith(
    //   recipes: await _getSavedRecipesUseCase.execute(),
    //   isLoading: false,
    // );
    // notifyListeners();

    /*
    _isLoading = true;
    // 로딩의 상태 (업데이트) 변경
    notifyListeners();

    // 불러오기 , 로드
    _recipes = await _getSavedRecipesUseCase.execute();
    _isLoading = false;
    // 상태 업데이트
    // ChangeNotifier 가 제공한다.
    notifyListeners();

     */
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    super.dispose();
  }
}
