import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:youniversity_app/layout/app_location_item.dart';
import 'package:youniversity_app/layout/bottom_nav_bar_widget.dart';

class AppLayout extends StatefulWidget {
  AppLayout({
    required this.navigation,
    super.key,
  }) : routerDelegate = _createRouter(navigation);

  final List<AppLocationItem> navigation;
  final BeamerDelegate routerDelegate;
  final beamerKey = GlobalKey<BeamerState>();
  final initialIndex = 0;

  static BeamerDelegate _createRouter(List<AppLocationItem> navigation) {
    final locations = navigation.map(((e) => e.beamLocation));

    return BeamerDelegate(
      locationBuilder: BeamerLocationBuilder(
        beamLocations: [
          ...locations,
        ],
      ),
    );
  }

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  Widget _createTitle(int index) {
    final title = widget.navigation[index].title.toUpperCase();
    return Text(title);
  }

  TabBar? _createTabBar(int index) {
    final config = widget.navigation[index].tabBar;
    if (config == null) return null;

    final items = config.items.map((e) => e.tab).toList();
    return TabBar(tabs: items);
  }

  void _setStateListener() => setState(() {});

  @override
  void initState() {
    super.initState();
    widget.routerDelegate.addListener(_setStateListener);
  }

  @override
  Widget build(BuildContext context) {
    int index = widget.navigation.indexWhere((e) => e.beamLocation.isCurrent);
    if (index == -1) index = widget.initialIndex;
    final title = _createTitle(index);
    final tabBar = _createTabBar(index);

    final scaffold = Scaffold(
      appBar: AppBar(
        title: title,
        bottom: tabBar,
      ),
      body: Beamer(
        key: widget.beamerKey,
        routerDelegate: widget.routerDelegate,
      ),
      bottomNavigationBar: BottomNavBarWidget(
        beamerKey: widget.beamerKey,
        navigation: widget.navigation,
      ),
    );

    if (tabBar == null) return scaffold;

    return DefaultTabController(
      length: tabBar.tabs.length,
      child: scaffold,
    );
  }

  @override
  void dispose() {
    widget.routerDelegate.removeListener(_setStateListener);
    super.dispose();
  }
}
