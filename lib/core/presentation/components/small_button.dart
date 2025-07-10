import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/ui/color_styles.dart';
import 'package:flutter_recipe_app_course/ui/text_styles.dart';

// StatefulWidget 는 상태가 필요하기때문에 씀
class SmallButton extends StatefulWidget {
  final String text;
  final void Function()? onPressed;
  final Color color;
  final TextStyle textStyle;

  const SmallButton(
    this.text, {
    super.key,
    required this.onPressed,
    this.color = ColorStyles.primary100,
    this.textStyle = TextStyles.normalTextBold,
  });

  @override
  State<SmallButton> createState() => _SmallButtonState();
}

class _SmallButtonState extends State<SmallButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    final buttonColor = widget.onPressed == null
    ? ColorStyles.gray4
        : (isPressed ? ColorStyles.gray4 : widget.color);

    return GestureDetector(
      onTapDown: widget.onPressed ==null ? null : (_) {
        setState(() {
          isPressed = true;
        });
      },
      onTapUp: widget.onPressed ==null ? null : (_) {
        setState(() {
          isPressed = false;
        });
        widget.onPressed?.call();
      },
      // 클릭하고 버튼 밖에서 땠을때 처리
      onTapCancel: widget.onPressed ==null ? null : () {
        setState(() {
          isPressed = false;
        });
      },

      child: Container(
        height: 37,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: buttonColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.text,
              // copyWith 는 runtime 에 실행 된다
              // 만약성능이 중요하다면 normalTextBold 에 미리 색깔을 넣자
              style: TextStyles.smallerTextBold.copyWith(
                  color: Colors.white
              ),
            ),
          ],
        ),
      ),
    );
  }
}
