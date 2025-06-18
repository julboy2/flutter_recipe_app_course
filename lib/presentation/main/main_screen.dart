import 'package:flutter/material.dart';

import '../../ui/color_styles.dart';

class MainScreen extends StatelessWidget {
  final Widget body;
  final int currentPageIndex;
  final void Function(int index) onChangeIndex;

  const MainScreen({
    super.key,
    required this.body,
    required this.currentPageIndex,
    required this.onChangeIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        indicatorColor: Colors.transparent,
        onDestinationSelected: (index) => onChangeIndex(index),
        selectedIndex: currentPageIndex,
        destinations: [
          const NavigationDestination(
            icon: Icon(Icons.home_outlined, color: ColorStyles.gray4),
            selectedIcon: Stack(
              children: [
                Icon(Icons.home, color: ColorStyles.primary40),
                Icon(Icons.home_outlined, color: ColorStyles.primary100),
              ],
            ),
            label: "Home",
          ),
          const NavigationDestination(
            icon: Icon(Icons.bookmark_border, color: ColorStyles.gray4),
            selectedIcon: Stack(
              children: [
                Icon(Icons.bookmark, color: ColorStyles.primary40),
                Icon(Icons.bookmark_border, color: ColorStyles.primary100),
              ],
            ),
            label: "Bookmark",
          ),
          const NavigationDestination(
            icon: Icon(Icons.notifications_outlined, color: ColorStyles.gray4),
            selectedIcon: Stack(
              children: [
                Icon(Icons.notifications, color: ColorStyles.primary40),
                Icon(Icons.notifications_outlined, color: ColorStyles.primary100),
              ],
            ),
            label: "Notifications",
          ),
          const NavigationDestination(
            icon: Icon(Icons.person_outline, color: ColorStyles.gray4),
            selectedIcon: Stack(
              children: [
                Icon(Icons.person, color: ColorStyles.primary40),
                Icon(Icons.person_outline, color: ColorStyles.primary100),
              ],
            ),
            label: "Person",
          ),
        ],
      ),
    );
  }
}
