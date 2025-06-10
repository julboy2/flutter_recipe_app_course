import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/ui/color_styles.dart';
import 'package:flutter_recipe_app_course/ui/text_styles.dart';

// StatefulWidget 는 상태가 필요하기때문에 씀
class SmallButton extends StatefulWidget {
  final String text;
  final void Function() onPressed;

  const SmallButton(this.text, {super.key, required this.onPressed});

  @override
  State<SmallButton> createState() => _SmallButtonState();
}

class _SmallButtonState extends State<SmallButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          isPressed = false;
        });
        widget.onPressed();
      },
      // 클릭하고 버튼 밖에서 땠을때 처리
      onTapCancel: () {
        setState(() {
          isPressed = false;
        });
      },

      child: Container(
        height: 37,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isPressed ? ColorStyles.gray4 : ColorStyles.primary100,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.text,
              // copyWith 는 runtime 에 실행 된다
              // 만약성능이 중요하다면 normalTextBold 에 미리 색깔을 넣자
              style: TextStyles.normalTextBold.copyWith(color: Colors.white),
            ),

          ],
        ),
      ),
    );
  }
}
