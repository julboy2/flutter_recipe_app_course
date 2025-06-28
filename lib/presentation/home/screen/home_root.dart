import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/core/di/di_setup.dart';
import 'package:flutter_recipe_app_course/core/routing/route_paths.dart';
import 'package:flutter_recipe_app_course/presentation/home/home_view_model.dart';

import 'package:go_router/go_router.dart';

import 'home_screen.dart';

class HomeRoot extends StatefulWidget {
  const HomeRoot({super.key});

  @override
  State<HomeRoot> createState() => _HomeRootState();
}

class _HomeRootState extends State<HomeRoot> {
  late HomeViewModel viewModel;
  StreamSubscription? eventSubscription;


  //화면이 켜지는 순간 로그 나타내기
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // StatefulWidget 을 썼기때문에
    // getIt<HomeViewModel>().eventStream. 여기에 있는  HomeViewModel 과 해당 viewModel 은 다르다.
    // 이렇게 해야 한가지 인스턴스로 저장할수가 있다.
    viewModel = getIt<HomeViewModel>();

    // 에러를 위해 작성
    // StatefulWidget 으로 가지고오면
    // 여기에 getIt<HomeViewModel> 과
    // 아래 viewModel = getIt<HomeViewModel> 여기의  다르기때문에
    // 조심해야 된다고 한다.
    // 그래서 위에 late HomeViewModel 을 선언해줘야 안전하다고안다.
    // getIt<HomeViewModel>().eventStream.listen((event) {

    eventSubscription = viewModel.eventStream.listen((event) {
      log(event.toString());

      // *중요* StatefulWidget 을썼을경우
      // ScaffoldMessenger.of(context).showSnackBar(snackBar); 을 보여주는 찰나에
      // context 가 사라지는 경우가 있다.
      // 화면을 빠르게 뒤로 가지고 간다는지
      // 그래서 mounted 체크를 여기서 할수가 있다.
      // mounted 체크는 StatefulWidget 일경우만 가능하다.
      // final snackBar = SnackBar(content: Text(event.toString()));
      // ScaffoldMessenger.of(context).showSnackBar(snackBar);
      if(mounted){
        final snackBar = SnackBar(content: Text(event.toString()));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
      // StatelessWidget 에서는 안전한 코드처럼 보이지만
      // eventStream.listen 해당 listen 안에 있는 코드는 비동기이다.
      // listen 코드를 돌리는 와중에 화면을 날려버릴 수 있다.
      // context 가 순간 날라갈 수 있다.
      // 그래서 안전하게 처리하기 위해 StatefulWidget 로 처리행야된다.

    });
  }

  // StatefulWidget 이기 때문에  dispose 해준다.
  @override
  void dispose() {
    eventSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final viewModel = getIt<HomeViewModel>();

    return ListenableBuilder(
      builder: (context, widget) {
        return HomeScreen(
          name: 'Jega',
          onTapSearchField: () => context.push(RoutePaths.search),
          state: viewModel.state,
          onSelectCategory: (String category) {
            viewModel.onSelectCategory(category);
          },
        );
      },
      listenable: viewModel,
    );
  }
}
