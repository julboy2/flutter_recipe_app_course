import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/core/routing/route_paths.dart';

import 'package:go_router/go_router.dart';

import 'home_screen.dart';

class HomeRoot extends StatelessWidget {
  const HomeRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeScreen(
      name: 'Jega',
      onTapSearchField: () => context.push(RoutePaths.search),
    );
  }
}
