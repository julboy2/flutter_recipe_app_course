import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/domain/model/procedure_entity.dart';

import '../../../ui/color_styles.dart';
import '../../../ui/text_styles.dart';

class ProcedureItem extends StatelessWidget {
  final ProcedureEntity procedure;

  const ProcedureItem({super.key, required this.procedure});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: ColorStyles.gray4,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Step ${procedure.step}"),
          const SizedBox(height: 5,),
          Text(
              procedure.content,
            style: TextStyles.smallerTextRegular.copyWith(
              color: ColorStyles.gray3,
            ),
          ),
        ],
      ),
    );
  }
}
