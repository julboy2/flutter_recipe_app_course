import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/domain/filter/filter_state.dart';
import 'package:flutter_recipe_app_course/presentation/search/screen/search_screen.dart';
import 'package:flutter_recipe_app_course/presentation/search/search_view_model.dart';

import '../../../core/di/di_setup.dart';
import '../../../core/presentation/components/search_filter_sheet.dart';

// localStorage 는 리셋이 되면 안되니깐
// 싱글톤 객체여야 된다.
// final LocalStorage _localStorage = DefaultLocalStorage();
//
//
// final _recentSearchRecipeRepository = MockRecentSearchRecipeRepositoryImpl(
//   localStorage: _localStorage,
// );
// di setup 으로 수정

class SearchRoot extends StatelessWidget {
  const SearchRoot({super.key});

  @override
  Widget build(BuildContext context) {
    // final viewModel = SearchViewModel(
    //   recentSearchRecipeRepository: _recentSearchRecipeRepository,
    //   searchRecipesUseCase: SearchRecipesUseCase(
    //       recipeRepository: MockRecipeRepositoryImpl(
    //           recipeDataSource: RemoteRecipeDataSourceImpl(),
    //       ), localStorage: _localStorage,
    //   ),
    // );

    final viewModel = getIt<SearchViewModel>();

    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, widget) {
        return SearchScreen(
          state: viewModel.state,
          // onChanged: (query) => viewModel.searchRecipes(query),
          onChanged: viewModel.searchRecipes,
          onTapFilter: () {
            showModalBottomSheet(
              context: context,
              // 화면 전체를 다덥는 창이 뜬다.
              isScrollControlled: true,
              builder: (context) {
                return SearchFilterSheet(
                  state: viewModel.state.filterState,
                  onChangeFilter: (FilterState state) {
                    viewModel.onChangeFilter(state);
                    Navigator.pop(context);
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
