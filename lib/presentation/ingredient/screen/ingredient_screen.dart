import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/presentation/ingredient/ingredient_action.dart';

import '../../../core/presentation/components/chef_profile.dart';
import '../../../core/presentation/components/ingredient_item.dart';
import '../../../core/presentation/components/ingredient_recipe_card.dart';
import '../../../core/presentation/components/procedure_item.dart';
import '../../../core/presentation/components/two_tab.dart';
import '../../../ui/color_styles.dart';
import '../../../ui/text_styles.dart';
import '../ingredient_state.dart';

// 화면에서 가지고 있는 메뉴는 별도로 정의한다.
enum IngredientMenu { share, rate, review, unSave }

class IngredientScreen extends StatelessWidget {
  final IngredientState state;
  final void Function(IngredientAction action) onAction;
  final void Function(IngredientMenu menu) onTapMenu;

  const IngredientScreen({
    super.key,
    required this.state,
    required this.onAction,
    required this.onTapMenu,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 뒤로가기 위해 appBar 상단 메뉴가 나오는부분인 것 같음
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_horiz),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  onTap: () => onTapMenu(IngredientMenu.share),
                  child: Row(
                    children: [
                      Icon(Icons.share, size: 20),
                      SizedBox(width: 16),
                      Text("Share", style: TextStyles.smallTextRegular),
                    ],
                  ),
                ),
                PopupMenuItem(
                  onTap: () => onTapMenu(IngredientMenu.rate),
                  child: Row(
                    children: [
                      Icon(Icons.star, size: 20),
                      SizedBox(width: 16),
                      Text("Rate Recipe", style: TextStyles.smallTextRegular),
                    ],
                  ),
                ),
                PopupMenuItem(
                  onTap: () => onTapMenu(IngredientMenu.review),
                  child: Row(
                    children: [
                      Icon(Icons.comment, size: 20),
                      SizedBox(width: 16),
                      Text("Review", style: TextStyles.smallTextRegular),
                    ],
                  ),
                ),
                PopupMenuItem(
                  onTap: () => onTapMenu(IngredientMenu.unSave),
                  child: Row(
                    children: [
                      Icon(Icons.bookmark, size: 20),
                      SizedBox(width: 16),
                      Text("Unsave", style: TextStyles.smallTextRegular),
                    ],
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              IngredientRecipeCard(
                recipe: state.recipe!,
                onTapFavorite: (recipe) {},
              ),
              const SizedBox(height: 10),
              ChefProfile(),
              const SizedBox(height: 20),
              TwoTab(
                selectedIndex: state.selectTabIndex,
                labels: const ["Ingredient", "Procedure"],
                onChange: (index) {
                  if (index == 0) {
                    onAction(const IngredientAction.onTapIngredient());
                  } else {
                    onAction(const IngredientAction.onTapProcedure());
                  }
                },
              ),
              const SizedBox(height: 35),

              Expanded(
                child: IndexedStack(
                  index: state.selectTabIndex,
                  children: [
                    // Expanded 로해야 보인다.
                    IngredientList(state: state),
                    ProcedureList(state: state),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProcedureList extends StatelessWidget {
  const ProcedureList({super.key, required this.state});

  final IngredientState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(Icons.room_service, size: 17, color: ColorStyles.gray3),
            const SizedBox(width: 5),
            Text(
              "1 serve",
              style: TextStyles.smallerTextRegular.copyWith(
                color: ColorStyles.gray3,
              ),
            ),
            const Spacer(),
            Text(
              "${state.procedures.length} Steps",
              style: TextStyles.smallerTextRegular.copyWith(
                color: ColorStyles.gray3,
              ),
            ),
          ],
        ),
        const SizedBox(height: 23.5),
        Expanded(
          child: ListView.builder(
            itemCount: state.procedures.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ProcedureItem(procedure: state.procedures[index]),
                  const SizedBox(height: 10),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class IngredientList extends StatelessWidget {
  const IngredientList({super.key, required this.state});

  final IngredientState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(Icons.room_service, size: 17, color: ColorStyles.gray3),
            const SizedBox(width: 5),
            Text(
              "1 serve",
              style: TextStyles.smallerTextRegular.copyWith(
                color: ColorStyles.gray3,
              ),
            ),
            const Spacer(),
            Text(
              "${state.ingredients.length} Items",
              style: TextStyles.smallerTextRegular.copyWith(
                color: ColorStyles.gray3,
              ),
            ),
          ],
        ),
        const SizedBox(height: 23.5),
        Expanded(
          child: ListView.builder(
            itemCount: state.ingredients.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  IngredientItem(ingredient: state.ingredients[index]),
                  const SizedBox(height: 10),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
