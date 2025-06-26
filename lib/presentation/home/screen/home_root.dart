import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/core/di/di_setup.dart';
import 'package:flutter_recipe_app_course/core/routing/route_paths.dart';
import 'package:flutter_recipe_app_course/presentation/home/home_view_model.dart';

import 'package:go_router/go_router.dart';

import 'home_screen.dart';

class HomeRoot extends StatelessWidget {
  const HomeRoot({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt<HomeViewModel>();
    return ListenableBuilder(
      builder: (context, widget) {
        return HomeScreen(
          name: 'Jega',
          onTapSearchField: () => context.push(RoutePaths.search),
          state: viewModel.state,
          onSelectCategory: (String category) {
            viewModel.onSelectCategory(category);
          },
        );
      },
      listenable: viewModel,
    );
  }
}
