import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/core/di/di_setup.dart';
import 'package:flutter_recipe_app_course/core/presentation/components/big_button.dart';
import 'package:flutter_recipe_app_course/core/presentation/components/filter_button.dart';
import 'package:flutter_recipe_app_course/core/presentation/components/input_field.dart';
import 'package:flutter_recipe_app_course/core/presentation/components/rating_button.dart';
import 'package:flutter_recipe_app_course/data/repository/mock_bookmark_repository_impl.dart';
import 'package:flutter_recipe_app_course/data/repository/mock_recipe_repository_impl.dart';
import 'package:flutter_recipe_app_course/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:flutter_recipe_app_course/presentation/saved_recipes/screen/saved_recipes_screen.dart';
import 'package:flutter_recipe_app_course/presentation/sign_in/sign_in_screen.dart';
import 'package:flutter_recipe_app_course/ui/text_styles.dart';

import 'core/presentation/components/medium_button.dart';
import 'core/presentation/components/search_input_field.dart';
import 'core/presentation/components/small_button.dart';
import 'core/presentation/components/two_tab.dart';
import 'core/presentation/dialogs/rating_dialog.dart';
import 'core/routing/router.dart';

void main() {
  // di 를 꼭 호출한다.
  diSetup();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),

    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Component",
          style: TextStyles.largeTextBold,
        ),
      ),
      body: ListView(
        children: [
          SearchInputField(placeHolder: "placeHolder",),
          ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) {
                      return RatingDialog(
                          title: 'Rate Recipe',
                          actionName: 'Send',
                          onChange: (score) {
                            print(score);
                          }
                      );
                    }
                );
              },
              child: const Text("RatingDialog")
          ),
          TwoTab(
            labels: const [
              "label 1",
              "label 2",
            ],
            selectedIndex: 0, onChange: (int index) {
            print("TwoTab : $index");
          },
          ),
          const RatingButton("text"),
          const RatingButton("text", isSelected: true,),
          const FilterButton("text"),
          const FilterButton("text", isSelected: true,),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BigButton("Big Button", onPressed: () {
              print("BigButton");
            },),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MediumButton("Medium Button", onPressed: () {
              print("MediumButton");
            },),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SmallButton("Small Button", onPressed: () {
              print("SmallButton");
            },),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: const InputField(label: "Label", placeHolder: "PlaceHolder"),
          )
        ],
      ),
    );
  }
}
