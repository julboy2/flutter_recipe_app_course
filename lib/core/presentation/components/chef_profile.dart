import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/core/presentation/components/small_button.dart';

import '../../../ui/color_styles.dart';
import '../../../ui/text_styles.dart';

class ChefProfile extends StatelessWidget {
  const ChefProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
          child: Image.network(
            "https://cdn.pixabay.com/photo/2022/10/19/01/02/woman-7531315_1280.png",
            width: 40,
            height: 40,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Laura wilson", style: TextStyles.smallTextBold),
            Row(
              children: [
                Icon(Icons.location_on, color: ColorStyles.primary80, size: 17),
                Text(
                  "Lagos, Nigeria",
                  style: TextStyles.smallerTextRegular.copyWith(
                    color: ColorStyles.gray3,
                  ),
                ),
              ],
            ),
          ],
        ),
        Spacer(),
        SizedBox(
          width: 85,
          height: 37,
          child: SmallButton(
              "Follow",
              onPressed: (){}
          ),
        )

      ],
    );
  }
}
