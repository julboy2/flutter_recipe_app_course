import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/core/presentation/components/search_input_field.dart';
import 'package:flutter_recipe_app_course/ui/color_styles.dart';

import '../../../ui/text_styles.dart';


class HomeScreen extends StatelessWidget {
  final String name;
  final void Function() onTapSearchField;

  const HomeScreen({super.key, required this.name, required this.onTapSearchField});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hello $name", style: TextStyles.largeTextBold),
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
                    onTap: onTapSearchField,  // 클릭시 상위부모에게 값전달
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
    );
  }
}
