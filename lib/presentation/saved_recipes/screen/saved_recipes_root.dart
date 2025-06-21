import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/core/di/di_setup.dart';
import 'package:flutter_recipe_app_course/presentation/saved_recipes/saved_recipes_view_model.dart';
import 'package:flutter_recipe_app_course/presentation/saved_recipes/screen/saved_recipes_screen.dart';

// Use case 같은 경우는 singleton 으로 활용이 되어도 되서 여기다가 만든다.
// 임의로 만든다.
// final _getSavedRecipesUseCase = GetSavedRecipesUseCase(
//   recipeRepository: MockRecipeRepositoryImpl(
//     recipeDataSource: RemoteRecipeDataSourceImpl(),
//   ),
//   bookmarkRepository: MockBookmarkRepositoryImpl(),
// );
// diSetup 에서 getit 써서 다시 di 로 만듬

class SavedRecipesRoot extends StatelessWidget {
  const SavedRecipesRoot({super.key});

  @override
  Widget build(BuildContext context) {
    // final viewModel = SavedRecipesViewModel(
    //   getSavedRecipesUseCase: _getSavedRecipesUseCase,
    // );
    final viewModel = getIt<SavedRecipesViewModel>();

    return ListenableBuilder(
      listenable: viewModel,
      // listenable 의 상태가 바뀌면 builder 이 리프레시가 된다.
      builder: (context, widget) {
        final state = viewModel.state;
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return SavedRecipesScreen(recipes: state.recipes);
      },
    );
  }
}
