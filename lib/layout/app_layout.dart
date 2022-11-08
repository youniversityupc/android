import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:youniversity_app/layout/app_location_item.dart';
import 'package:youniversity_app/layout/route_constants.dart';

class AppLayout extends StatefulWidget {
  AppLayout({
    required this.navigation,
    this.onlyBeamer = false,
    this.initialIndex = 0,
    super.key,
  }) : router = _createRouter(navigation);

  final List<AppLocationItem> navigation;
  final BeamerDelegate router;
  final bool onlyBeamer;
  final int initialIndex;
  final beamerKey = GlobalKey<BeamerState>();

  static BeamerDelegate _createRouter(List<AppLocationItem> navigation) {
    final locations = navigation.map(((e) => e.location)).toList();

    return BeamerDelegate(
      locationBuilder: BeamerLocationBuilder(beamLocations: locations),
    );
  }

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  late int _index;

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

  void _onAvatarTapped() {
    widget.router.beamToNamed(RouteConstants.profile);
  }

  void _setStateListener() {
    int index = widget.navigation.indexWhere((e) => e.location.isCurrent);
    setState(() {
      _index = index != -1 ? index : widget.initialIndex;
    });
  }

  @override
  void initState() {
    super.initState();
    _setStateListener();
    widget.router.addListener(_setStateListener);
  }

  @override
  Widget build(BuildContext context) {
    final title = _createTitle(_index);
    final tabBar = _createTabBar(_index);
    final length = tabBar?.tabs.length ?? 0;
    final onlyBeamer = widget.navigation[_index].onlyBeamer;

    return DefaultTabController(
      length: length,
      child: Scaffold(
        appBar: onlyBeamer
            ? null
            : AppBar(
                title: title,
                actions: [
                  GestureDetector(
                    onTap: _onAvatarTapped,
                    child: const CircleAvatar(
                      child: Text('D'),
                    ),
                  )
                ],
                bottom: tabBar,
              ),
        body: Container(
          margin:
              onlyBeamer ? const EdgeInsets.only(top: kToolbarHeight) : null,
          child: Beamer(
            key: widget.beamerKey,
            routerDelegate: widget.router,
          ),
        ),
        bottomNavigationBar: onlyBeamer
            ? null
            : BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: true,
                currentIndex: _index,
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
