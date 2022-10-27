import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:youniversity_app/layout/app_location_item.dart';

class AppLayout extends StatefulWidget {
  AppLayout({
    required this.navigation,
    super.key,
  }) : router = _createRouter(navigation);

  final List<AppLocationItem> navigation;
  final BeamerDelegate router;
  final beamerKey = GlobalKey<BeamerState>();
  final initialIndex = 0;

  static BeamerDelegate _createRouter(List<AppLocationItem> navigation) {
    final locations = navigation.map(((e) => e.location));

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
  int _getCurrentIndex() {
    int index = widget.navigation.indexWhere((e) => e.location.isCurrent);
    return index == -1 ? widget.initialIndex : index;
  }

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

  List<BottomNavigationBarItem> _createBottomNavItemList() {
    final valid = widget.navigation.where((e) => e.navigation != null);
    return valid.map((e) => e.navigation!).toList();
  }

  void _onNavBarItemTapped(int index) {
    final path = widget.navigation[index].initialPath;
    widget.router.beamToNamed(path);
  }

  void _setStateListener() => setState(() {});

  @override
  void initState() {
    super.initState();
    widget.router.addListener(_setStateListener);
  }

  @override
  Widget build(BuildContext context) {
    final index = _getCurrentIndex();
    final title = _createTitle(index);
    final tabBar = _createTabBar(index);

    return DefaultTabController(
      length: tabBar?.tabs.length ?? 0,
      child: Scaffold(
        appBar: AppBar(
          title: title,
          bottom: tabBar,
        ),
        body: Beamer(
          key: widget.beamerKey,
          routerDelegate: widget.router,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          currentIndex: index,
          items: _createBottomNavItemList(),
          onTap: _onNavBarItemTapped,
        ),
      ),
    );
  }

  @override
  void dispose() {
    widget.router.removeListener(_setStateListener);
    super.dispose();
  }
}
