import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/core/routing/route_paths.dart';
import 'package:flutter_recipe_app_course/main.dart';
import 'package:flutter_recipe_app_course/presentation/ingredient/screen/ingredient_root.dart';
import 'package:flutter_recipe_app_course/presentation/main/main_screen.dart';
import 'package:flutter_recipe_app_course/presentation/notifications/notifications_screen.dart';
import 'package:flutter_recipe_app_course/presentation/profile/profile_screen.dart';
import 'package:flutter_recipe_app_course/presentation/search/screen/search_root.dart';
import 'package:flutter_recipe_app_course/presentation/search/screen/search_screen.dart';
import 'package:flutter_recipe_app_course/presentation/sign_in/sign_in_screen.dart';
import 'package:flutter_recipe_app_course/presentation/sign_up/sign_up_screen.dart';
import 'package:flutter_recipe_app_course/presentation/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

import '../../data/repository/mock_bookmark_repository_impl.dart';
import '../../data/repository/mock_recipe_repository_impl.dart';
import '../../domain/use_case/get_saved_recipes_use_case.dart';
import '../../presentation/home/screen/home_root.dart';
import '../../presentation/saved_recipes/screen/saved_recipes_root.dart';
import '../../presentation/saved_recipes/screen/saved_recipes_screen.dart';

final router = GoRouter(
  initialLocation: RoutePaths.splash,
  // initialLocation: RoutePaths.test,
  routes: [
    GoRoute(
      path: RoutePaths.ingredient,
      builder: (context, state) {
        final recipeId = int.parse(state.pathParameters["recipeId"]!) ;
        return IngredientRoot(recipeId: recipeId,);
      },
    ),
    GoRoute(
      path: RoutePaths.test,
      builder: (context, state) => const MyHomePage(),
    ),
    GoRoute(
      path: RoutePaths.splash,
      builder: (context, state) => SplashScreen(
        onTapStartCooking: () {
          // 이동시 statck 에 쌓지 않고 replace 한다.
          context.go(RoutePaths.signIn);
        },
      ),
    ),
    GoRoute(
      path: RoutePaths.signUp,
      builder: (context, state) =>
          SignUpScreen(onTapSignIn: () => context.go(RoutePaths.signIn)),
    ),
    GoRoute(
      path: RoutePaths.signIn,
      builder: (context, state) => SignInScreen(
        onTapSignUp: () {
          context.go(RoutePaths.signUp);
        },
        onTapSignIn: () {
          context.go(RoutePaths.home);
        },
      ),
    ),
    GoRoute(
      path: RoutePaths.search,
      builder: (context, state) => const SearchRoot(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainScreen(
          body: navigationShell,
          // HomeScreen() , SavedRecipesRoot() 해당 부분이 들어온다.
          currentPageIndex: navigationShell.currentIndex,
          onChangeIndex: (index) {
            navigationShell.goBranch(
              index,
              initialLocation: index == navigationShell.currentIndex, // 현재 페이지면
            );
          },
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RoutePaths.home,
              builder: (context, state) => const HomeRoot(),
              // routes: [
              //   // Search 페이지로 갔을때 ,
              //   // 하단 네비게이션 바가 그대로 있길원하면 위치를 여기로 한다.
              //   GoRoute(
              //     path: "Search",
              //     builder: (context, state) => const SearchScreen(),
              //   ),
              // ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RoutePaths.savedRecipes,
              builder: (context, state) => SavedRecipesRoot(),
              // builder: (context, state) => FutureBuilder(
              //   future: GetSavedRecipesUseCase(
              //     recipeRepository: MockRecipeRepositoryImpl(),
              //     bookmarkRepository: MockBookmarkRepositoryImpl(),
              //   ).execute(),
              //
              //   // builder: (context, asyncSnapshot) {
              //   //   if (asyncSnapshot.connectionState == ConnectionState.waiting) {
              //   //     return const Center(child: CircularProgressIndicator());
              //   //   }
              //   //
              //   //   final recipes = asyncSnapshot.data!;
              //   //
              //   //   return SavedRecipesScreen(recipes: recipes);
              //   // },
              // ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RoutePaths.notifications,
              builder: (context, state) => NotificationsScreen(),
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RoutePaths.profile,
              builder: (context, state) => ProfileScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
