import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/domain/model/recipe.dart';

import '../../domain/use_case/get_saved_recipes_use_case.dart';

// MVVM 패턴
// 상태를 모니터링해서 화면이 알아서 UI 업데이트하는 컨셉 이 MVVM 패턴이다.
class SavedRecipesViewModel with ChangeNotifier {
  final GetSavedRecipesUseCase _getSavedRecipesUseCase;

  // 상태
  List<Recipe> _recipes = [];

  // 외부에서 수정이 불가능하도록 unmodifiable 사용 하는게 국룰
  List<Recipe> get recipes => List.unmodifiable(_recipes);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // 소스에서는
  // SavedRecipesViewModel({
  //   required GetSavedRecipesUseCase getSavedRecipesUseCase,
  // }) : _getSavedRecipesUseCase = getSavedRecipesUseCase{
  //   _loadRecipeData();
  // }

  SavedRecipesViewModel.name(this._getSavedRecipesUseCase){
    _loadRecipeData();
  }

  void _loadRecipeData() async{
    _isLoading = true;
    // 로딩의 상태 (업데이트) 변경
    notifyListeners();

    // 불러오기 , 로드
    _recipes = await _getSavedRecipesUseCase.execute();
    _isLoading = false;
    // 상태 업데이트
    // ChangeNotifier 가 제공한다.
    notifyListeners();
  }

}
