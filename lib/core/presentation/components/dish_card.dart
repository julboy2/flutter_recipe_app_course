import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/domain/model/recipe.dart';
import 'package:flutter_recipe_app_course/ui/color_styles.dart';

import '../../../ui/text_styles.dart';

class DishCard extends StatelessWidget {
  final Recipe recipe;
  final void Function(Recipe recipe) onTapFavorite;

  const DishCard({
    super.key,
    required this.recipe,
    required this.onTapFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 230,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              // container 는 자식 크기를 따라간다.
              width: 150,
              height: 176,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: ColorStyles.gray4,
              ),
              child: Center(
                child: SizedBox(
                  width: 130,
                  height: 42,
                  child: Text(
                    recipe.name,
                    style: TextStyles.smallTextBold,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 10,
            bottom: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Time",
                  style: TextStyles.smallerTextRegular.copyWith(
                    color: ColorStyles.gray3,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  recipe.time,
                  style: TextStyles.smallerTextBold.copyWith(
                    color: ColorStyles.gray1,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: GestureDetector(
              onTap: () => onTapFavorite(recipe),
              child: Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.bookmark_outline,
                  color: recipe.isFavorite ? ColorStyles.primary80 : ColorStyles.gray3,
                  size: 16,
                ),
              ),
            ),
          ),
          Positioned(
            // left , right 둘다 0주면 가운데 정렬됨
            left: 0,
            right: 0,
            child: SizedBox(
              width: 110,
              height: 110,
              child: CircleAvatar(backgroundImage: NetworkImage(recipe.image)),
            ),
          ),
          Positioned(
            top: 30,
            right: 0,
            child: Container(
              width: 45,
              height: 23,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ColorStyles.secondary20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, color: ColorStyles.rating, size: 10),
                  Text(
                    recipe.rating.toString(),
                    style: TextStyles.smallerTextRegular,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
