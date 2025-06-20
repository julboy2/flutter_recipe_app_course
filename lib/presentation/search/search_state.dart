import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/recipe.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState{
  @override
  final List<Recipe> recipes;
  @override
  final bool isLoading;
  @override
  final String searchTitle;
  @override
  final String resultsCount;


  const SearchState({
    this.recipes = const [],
    this.isLoading = false,
    this.searchTitle = "Resent Search",
    this.resultsCount = "",
  });
}