import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/domain/use_case/get_dishes_by_category_use_case.dart';
import 'package:flutter_recipe_app_course/presentation/home/home_state.dart';

import '../../domain/use_case/get_categories_use_case.dart';

class HomeViewModel with ChangeNotifier {
  final GetCategoriesUseCase _getCategoriesUseCase;
  final GetDishesByCategoryUseCase _getDishesByCategoryUseCase;

  // HomeViewModel.name(this._getCategoriesUseCase);
  HomeViewModel({
    required GetCategoriesUseCase getCategoriesUseCase,
    required GetDishesByCategoryUseCase getDishesByCategoryUseCase,
  }) : _getCategoriesUseCase = getCategoriesUseCase,
       _getDishesByCategoryUseCase = getDishesByCategoryUseCase {
    _fetchCategories();
  }

  HomeState _state = const HomeState();

  HomeState get state => _state;

  void _fetchCategories() async {
    _state = state.copyWith(
      categories: await _getCategoriesUseCase.execute(),
      selectedCategory: "All",
    );
    notifyListeners();

    await _fetchDishesByCategory("All");
    notifyListeners();
  }

  Future<void> _fetchDishesByCategory(String category) async{
    final dishes = await _getDishesByCategoryUseCase.execute(category);
    _state = state.copyWith(dishes: dishes);
    notifyListeners();
  }

  void onSelectCategory(String category) async {
    _state = state.copyWith(selectedCategory: category);
    notifyListeners();

    await _fetchDishesByCategory(category);
  }

}
