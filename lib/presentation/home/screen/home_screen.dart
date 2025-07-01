import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/core/presentation/components/search_input_field.dart';
import 'package:flutter_recipe_app_course/ui/color_styles.dart';

import '../../../core/presentation/components/dish_card.dart';
import '../../../core/presentation/components/new_recipe_card.dart';
import '../../../core/presentation/components/recipe_category_selector.dart';
import '../../../ui/text_styles.dart';
import '../home_action.dart';
import '../home_state.dart';

class HomeScreen extends StatelessWidget {
  // MVI 패턴
  // 장점 : 상태와 콜백이 하나로 모였다.
  final HomeState state;
  final void Function(HomeAction action) onAction;

  const HomeScreen({
    super.key,
    required this.state,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Hello ${state.name}", style: TextStyles.largeTextBold),
                          const SizedBox(height: 5),
                          Text(
                            "What are you cooking today?",
                            style: TextStyles.smallerTextRegular.copyWith(
                              color: ColorStyles.gray3,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ColorStyles.secondary40,
                        ),
                        child: Image.asset("assets/image/face.png"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          // 해당 이벤트를 클릭해도 위에 아래 onTap 를 클릭해도
                          // GestureDetector 가 동작을 안하기 때문에
                          // IgnorePointer 로 감싸고 behavior: HitTestBehavior.opaque 속성을 준다..
                          // behavior: HitTestBehavior.opaque, 해당 속성은 ontap 이 일어나는 영역을 확실하게 해주는 역할이다.
                          behavior: HitTestBehavior.opaque,
                          onTap: () => onAction(const HomeAction.onTapSearchField()) , // 클릭시 상위부모에게 값전달
                          child: IgnorePointer(
                            child: SearchInputField(
                              // 해당 이벤트를 클릭해도 위에 GestureDetector 가 동작을 안하기 때문에
                              // IgnorePointer 로 감싼다.
                              placeHolder: "Search Recipe",
                              isReadonly: true,
                            ),
                          ),
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
                ],
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 10, bottom: 10),
              child: RecipeCategorySelector(
                categories: state.categories,
                selectedCategory: state.selectedCategory,
                onSelectCategory: (category) =>
                  onAction(HomeAction.onSelectCategory(category)),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: state.dishes.map((e) => Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: DishCard(
                      recipe: e,
                      isFavorite: true,
                    ),
                  )).toList(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "New Recipes",
                    style: TextStyles.normalTextBold,
                  ),
                  SizedBox(height: 5,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: state.newRecipes.map((e) => Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: NewRecipeCard(recipe: e,),
                      )).toList(),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
