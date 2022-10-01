import 'package:flutter/material.dart';

class AppLayoutTabBar {
  late TabController? controller;
  final List<Tab> items;
  final List<Widget> children;

  AppLayoutTabBar({
    required this.items,
    required this.children,
  }) : assert(items.length == children.length);
}

class AppLayoutNavigationItem {
  final String title;
  final BottomNavigationBarItem navigation;
  final Widget? children;
  final AppLayoutTabBar? tabBar;

  const AppLayoutNavigationItem({
    required this.title,
    required this.navigation,
    this.children,
    this.tabBar,
  });
}
