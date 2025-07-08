import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/core/di/di_setup.dart';
import 'package:flutter_recipe_app_course/core/routing/route_paths.dart';
import 'package:flutter_recipe_app_course/presentation/saved_recipes/saved_recipes_view_model.dart';
import 'package:flutter_recipe_app_course/presentation/saved_recipes/screen/saved_recipes_screen.dart';
import 'package:go_router/go_router.dart';

import '../saved_recipes_action.dart';

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

  // goRoute 를 쓰면 해당 탭호출시
  // 딱 1번만 initState() 가 호출된다.
  // 다른탭에 갔다가 다시 해당 탭으로와도 호출되지 않는다.
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   print("_SavedRecipesRootState");
  // }

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

        return SavedRecipesScreen(
          recipes: state.recipes,
          onAction: (action){
            if(action is OnTapRecipe){
              context.push("/Home/Ingredient/${action.recipe.id}");
              return;
            }
            viewModel.onAction(action);
          }

        );
      },
    );
  }
}
