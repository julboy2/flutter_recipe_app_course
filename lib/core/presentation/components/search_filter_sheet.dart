import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/core/presentation/components/filter_buttons.dart';
import 'package:flutter_recipe_app_course/core/presentation/components/small_button.dart';

import '../../../domain/filter/filter_state.dart';
import '../../../ui/text_styles.dart';

class SearchFilterSheet extends StatefulWidget {
  // 마지막 상태값을 받기위해 인자로 받는다.
  final FilterState state;
  final void Function(FilterState state) onChangeFilter;


  const SearchFilterSheet({super.key, required this.state, required this.onChangeFilter});

  @override
  State<SearchFilterSheet> createState() => _SearchFilterSheetState();
}

class _SearchFilterSheetState extends State<SearchFilterSheet> {
  late FilterState _state;

  @override
  void initState(){
    super.initState();
    _state = widget.state;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),

      child: Column(
        // 부모창에서 isScrollControlled: true, 옵션을 줬기때문에
        // 창을 모두 닫아서
        // 최소한의 창으로만 뜨게하려고 MainAxisSize.min 옵션을줌
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 31),
          SizedBox(
            width: double.infinity,
            child: Text(
              "Filter Search",
              style: TextStyles.smallerTextBold,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20),
          Text("Time", style: TextStyles.smallerTextBold),
          SizedBox(height: 10),
          FilterButtons(
            items: ["All", "Newest", "Oldest", "Popularity"],
            selectedItem: _state.time,
            onSelected: (String item) {
              setState(() {
                _state = _state.copyWith(time: item);
              });
            },
          ),

          SizedBox(height: 20),
          Text("Rate", style: TextStyles.smallerTextBold),
          SizedBox(height: 10),
          FilterButtons(
            items: ["5", "4", "3", "2", "1"],
            selectedItem: _state.rate.toString(),
            onSelected: (String item) {
              setState(() {
                _state = _state.copyWith(rate: int.parse(item) );
              });
            },
          ),

          SizedBox(height: 20),
          Text("Category", style: TextStyles.smallerTextBold),
          SizedBox(height: 10),
          FilterButtons(
            items: [
              "All",
              "Cereal",
              "Vegetables",
              "Dinner",
              "Chinese",
              "Local Dish",
              "Fruit",
              "BreadFast",
              "Spanish",
              "Lunch",
            ],
            selectedItem: _state.category,
            onSelected: (String item) {
              setState(() {
                _state = _state.copyWith(category: item);
              });
            },
          ),
          SizedBox(height: 30),
          Row(
            children: [
              const Spacer(),
              SizedBox(
                width: 174,
                child: SmallButton("Filter", onPressed: () {
                  widget.onChangeFilter(_state);
                  // 레이어창 닫기
                  Navigator.pop(context);
                }),
              ),
              const Spacer(),
            ],
          ),
          SizedBox(height: 22),
        ],
      ),
    );
  }
}
