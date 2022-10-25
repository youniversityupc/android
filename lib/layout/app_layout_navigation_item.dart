import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class AppLayoutNavigationItem {
  final String title;
  final BeamLocation beamLocation;
  final BottomNavigationBarItem? navigation;
  final AppLayoutTabBar? tabBar;

  const AppLayoutNavigationItem({
    required this.title,
    required this.beamLocation,
    this.navigation,
    this.tabBar,
  });

  AppLayoutNavigationItem.upper({
    required String title,
    required this.navigation,
    required this.beamLocation,
    this.tabBar,
  }) : title = title.toUpperCase();
}

class AppLayoutTabBar {
  late TabController? controller;
  final List<AppLayoutTabBarItem> items;

  AppLayoutTabBar({required this.items});
}

class AppLayoutTabBarItem {
  final Tab tab;
  final String path;

  const AppLayoutTabBarItem({
    required this.tab,
    required this.path,
  });

  AppLayoutTabBarItem.fromText({
    required String tab,
    required this.path,
  }) : tab = Tab(text: tab.toUpperCase());
}
