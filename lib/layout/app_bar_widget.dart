import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:youniversity_app/layout/app_location_item.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  const AppBarWidget({
    required this.beamerKey,
    required this.navigation,
    super.key,
  });

  final GlobalKey<BeamerState> beamerKey;
  final List<AppLocationItem> navigation;

  @override
  Size get preferredSize {
    final index = navigation.indexWhere((e) => e.beamLocation.isCurrent);
    final tabBar = navigation[index].tabBar;
    TabBar? tabBarView;
    if (index != -1 && tabBar != null) {
      tabBarView = TabBar(tabs: tabBar.items.map((e) => e.tab).toList());
    }
    final appBar = AppBar(bottom: tabBarView);
    return appBar.preferredSize;
  }

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget>
    with SingleTickerProviderStateMixin {
  late BeamerDelegate _beamerDelegate;

  int get _currentIndex =>
      widget.navigation.indexWhere((element) => element.beamLocation.isCurrent);

  String get _title => widget.navigation[_currentIndex].title;

  TabBar? get _tabBar {
    var tabBar = widget.navigation[_currentIndex].tabBar;
    if (tabBar == null) {
      return null;
    }

    tabBar.controller ??= TabController(
      length: tabBar.items.length,
      vsync: this,
    );

    return TabBar(
      controller: tabBar.controller,
      tabs: tabBar.items.map((e) => e.tab).toList(),
    );
  }

  void _setStateListener() => setState(() {});

  @override
  void initState() {
    super.initState();
    _beamerDelegate = widget.beamerKey.currentState!.routerDelegate;
    _beamerDelegate.addListener(_setStateListener);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(_title),
      bottom: _tabBar,
    );
  }

  @override
  void dispose() {
    _beamerDelegate.removeListener(_setStateListener);
    super.dispose();
  }
}
