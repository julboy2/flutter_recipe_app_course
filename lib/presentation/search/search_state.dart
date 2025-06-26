import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/filter/filter_state.dart';
import '../../domain/model/recipe.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  @override
  final List<Recipe> recipes;
  @override
  final bool isLoading;
  @override
  final String searchTitle;
  @override
  final String resultsCount;
  @override
  final FilterState filterState;
  @override
  final String query;

  const SearchState({
    this.recipes = const [],
    this.isLoading = false,
    this.searchTitle = "Resent Search",
    this.resultsCount = "",
    this.filterState = const FilterState(
        time: 'All',
        rate: 1,
        category: 'All',
    ),
    this.query = "",
  });

}
