import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/ui/color_styles.dart';
import 'package:flutter_recipe_app_course/ui/text_styles.dart';

import '../../../domain/model/recipe.dart';

class RecipeGridItem extends StatelessWidget {
  final Recipe recipe;

  const RecipeGridItem({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(recipe.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 10,
            bottom: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200,
                  child: Text(
                    recipe.name,
                    style: TextStyles.smallerTextBold.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  "By ${recipe.chef}",
                  style: TextStyles.smallerTextRegular.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            top: 10,
            right: 10,
            child: Container(
              width: 37,
              height: 16,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ColorStyles.secondary20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.star,
                    color: ColorStyles.rating,
                    size: 12,
                  ),
                  Text(
                    recipe.rating.toString(),
                    style: TextStyles.smallerTextRegular,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
