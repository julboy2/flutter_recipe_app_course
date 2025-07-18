import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/domain/model/recipe.dart';
import 'package:flutter_recipe_app_course/presentation/saved_recipes/saved_recipes_action.dart';

import '../../../core/presentation/components/recipe_card.dart';
import '../../../ui/text_styles.dart';

class SavedRecipesScreen extends StatelessWidget {
  final List<Recipe> recipes;
  final void Function(SavedRecipesAction action) onAction;

  const SavedRecipesScreen({
    super.key,
    required this.recipes,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Saved recipes", style: TextStyles.mediumTextBold),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView.builder(
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => onAction(SavedRecipesAction.onTapRecipe(recipes[index])),
              child: RecipeCard(
                recipe: recipes[index],
                onTapFavorite: (Recipe recipe) {
                  onAction(SavedRecipesAction.onTapFavorite(recipe));
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
