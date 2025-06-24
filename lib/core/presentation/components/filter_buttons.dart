import 'package:flutter/material.dart';

import 'filter_button.dart';

class FilterButtons extends StatelessWidget {
  final List<String> items;
  final String selectedItem;
  final void Function(String item) onSelected;

  const FilterButtons({
    super.key,
    required this.items,
    required this.selectedItem,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    // Warp 는 길이가 길면 자동으로 엔터처리가 되어 내려가는 위젯
    return Wrap(
      children: items.expand((e) {
        return [
          GestureDetector(
            onTap: () => onSelected(e),
            child: FilterButton(e, isSelected: e == selectedItem),
          ),
          SizedBox(width: 10),
        ];
      }).toList(),
    );
  }
}
