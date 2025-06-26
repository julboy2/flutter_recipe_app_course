import 'package:flutter/material.dart';

import '../../../ui/color_styles.dart';
import '../../../ui/text_styles.dart';

class RecipeCategorySelector extends StatelessWidget {
  final List<String> categories;
  final String selectedCategory;
  final void Function(String category) onSelectCategory;

  const RecipeCategorySelector({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onSelectCategory,
  });

  @override
  Widget build(BuildContext context) {
    // 해당 범위만 스크롤 되도록 사용
    return SingleChildScrollView(
      // 어떤 방향으로 스크롤 할지 옵션 적용
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((e) {
          return GestureDetector(
            // 패딩을 클릭해도 반응을 하기위해 추가
            behavior: HitTestBehavior.opaque,
            onTap: () => onSelectCategory(e),
            child: e == selectedCategory
                ? SelectedCategory(category: e)
                : UnSelectedCategory(category: e),
          );
        }).toList(),
      ),
    );
  }
}

class UnSelectedCategory extends StatelessWidget {
  final String category;

  const UnSelectedCategory({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      child: Text(
        category,
        style: TextStyles.smallerTextBold.copyWith(
          color: ColorStyles.primary80,
        ),
      ),
    );
  }
}

class SelectedCategory extends StatelessWidget {
  final String category;

  const SelectedCategory({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorStyles.primary100,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      child: Text(
        category,
        style: TextStyles.smallerTextBold.copyWith(color: Colors.white),
      ),
    );
  }
}
