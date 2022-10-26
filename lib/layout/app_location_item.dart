import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class AppLocationItem {
  final String title;
  final String initialPath;
  final BeamLocation beamLocation;
  final BottomNavigationBarItem? navigation;
  final AppLocationTabBar? tabBar;

  AppLocationItem({
    required String title,
    required this.initialPath,
    required this.beamLocation,
    this.navigation,
    this.tabBar,
  }) : title = title.toUpperCase();
}

class AppLocationTabBar {
  TabController? controller;
  final List<AppLocationTabBarItem> items;

  AppLocationTabBar({required this.items});
}

class AppLocationTabBarItem {
  final Tab tab;
  final String path;

  const AppLocationTabBarItem({
    required this.tab,
    required this.path,
  });

  AppLocationTabBarItem.fromText({
    required String tab,
    required String path,
  }) : this(tab: Tab(text: tab), path: path);
}
