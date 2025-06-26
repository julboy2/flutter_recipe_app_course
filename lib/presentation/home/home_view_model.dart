import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/presentation/home/home_state.dart';

class HomeViewModel with ChangeNotifier {
  HomeState _state = const HomeState(
    categories: [
      "All",
      "Indian",
      "Italian",
      "Asian",
      "Chinese",
      "Japanese",
    ],
    selectedCategory: "All",
  );

  HomeState get state => _state;

  void onSelectCategory(String category) async {
    _state = state.copyWith(selectedCategory: category);
    notifyListeners();
  }
}