import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/core/presentation/components/recipe_card.dart';
import 'package:flutter_recipe_app_course/presentation/search/search_state.dart';

import '../../../core/presentation/components/recipe_grid_item.dart';
import '../../../core/presentation/components/search_input_field.dart';
import '../../../ui/color_styles.dart';
import '../../../ui/text_styles.dart';

class SearchScreen extends StatelessWidget {
  final SearchState state;

  const SearchScreen({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search recipes", style: TextStyles.mediumTextBold),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 17),
            Row(
              children: [
                const Expanded(
                  child: SearchInputField(
                    // 해당 이벤트를 클릭해도 위에 GestureDetector 가 동작을 안하기 때문에
                    // IgnorePointer 로 감싼다.
                    placeHolder: "Search Recipe",
                  ),
                ),
                const SizedBox(width: 20),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorStyles.primary100,
                  ),
                  child: Icon(Icons.tune, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text("Recent Search", style: TextStyles.normalTextBold),
            const SizedBox(height: 20),
            // 남아 있는 공간에 사이즈를 주기위해 Expanded 추가
            Expanded(
              child: state.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        // 해당 이미지를 몇줄씩 나오게 할지
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                      ),
                      itemCount: state.recipes.length,
                      itemBuilder: (context, index) {
                        final recipe = state.recipes[index];
                        return RecipeGridItem(recipe: recipe);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
