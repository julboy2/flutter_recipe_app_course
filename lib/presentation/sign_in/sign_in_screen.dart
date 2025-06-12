import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/core/presentation/components/big_button.dart';
import 'package:flutter_recipe_app_course/core/presentation/components/input_field.dart';

import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // SafeArea 를 넣으면 위에 전체로 떠버려서 SafeArea 를 넣는다.
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20,),
                const Text(
                  "Hello",
                  style: TextStyles.headerTextBold,
                ),
                const Text(
                  "Welcome Back!",
                  style: TextStyles.largeTextRegular,
                ),
                const SizedBox(height: 57,),
                const InputField(
                    label: "Email",
                    placeHolder: "Enter Email"
                ),
                const SizedBox(height: 30,),
                const InputField(
                    label: "Password",
                    placeHolder: "Enter Password"
                ),
                const SizedBox(height: 20,),
                Text(
                  "Forgot Password?",
                  style: TextStyles.smallerTextRegular.copyWith(
                    color: ColorStyles.secondary100,
                  ),
                ),
                const SizedBox(height: 25,),
                BigButton("Sign In", onPressed: (){}),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 1,
                      color: ColorStyles.gray4,
                    ),
                    const SizedBox(width: 7,),
                    Text(
                        "Or Sign in With",
                      style: TextStyles.smallerTextBold.copyWith(
                        color: ColorStyles.gray4
                      ),
                    ),
                    const SizedBox(width: 7,),
                    Container(
                      width: 50,
                      height: 1,
                      color: ColorStyles.gray4,
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/image/google_button.png",
                      width: 60,
                      height: 60,
                    ),
                    const SizedBox(width: 15,),
                    Image.asset(
                      "assets/image/facebook_button.png",
                      width: 60,
                      height: 60,
                    ),
                  ],
                ),
                const SizedBox(height: 55,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: TextStyles.smallerTextBold,
                    ),
                    Text(
                      "Sign up ",
                      style: TextStyles.smallerTextBold.copyWith(
                        color: ColorStyles.secondary100,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
      ),
    );
  }
}
