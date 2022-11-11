import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:youniversity_app/components/profile_avatar.dart';
import 'package:youniversity_app/layout/app_location_item.dart';
import 'package:youniversity_app/layout/route_constants.dart';

class AppLayout extends StatefulWidget {
  AppLayout({
    required this.navigation,
    this.initialIndex = 0,
    super.key,
  }) : router = _createRouter(navigation);

  final List<AppLocationItem> navigation;
  final BeamerDelegate router;
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

class _AppBarConfig {
  final AppBar appBar;
  final int length;

  const _AppBarConfig(this.appBar, this.length);
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

  _AppBarConfig? _createAppBar(int index) {
    final onlyBeamer = widget.navigation[index].onlyBeamer;
    if (onlyBeamer) return null;

    final title = _createTitle(_index);
    final tabBar = _createTabBar(_index);
    final length = tabBar?.tabs.length ?? 0;

    final appBar = AppBar(
      title: title,
      actions: [
        ProfileAvatar(
          size: ProfileAvatarSize.extraSmall,
          backgroundImage: const AssetImage('assets/dalb.jpg'),
          child: InkWell(
            onTap: _onAvatarTapped,
          ),
        ),
        const SizedBox(width: 16),
      ],
      bottom: tabBar,
    );

    return _AppBarConfig(appBar, length);
  }

  List<BottomNavigationBarItem> _createBottomNavItemList() {
    final valid = widget.navigation.where((e) => e.navigation != null);
    return valid.map((e) => e.navigation!).toList();
  }

  BottomNavigationBar? _createBottomNavBar(int index) {
    final onlyBeamer = widget.navigation[index].onlyBeamer;
    if (onlyBeamer) return null;
    final items = _createBottomNavItemList();
    final current = index > 0 && index < items.length ? index : 0;
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      currentIndex: current,
      items: items,
      onTap: _onNavBarItemTapped,
    );
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
    final appBarConfig = _createAppBar(_index);

    return DefaultTabController(
      length: appBarConfig?.length ?? 0,
      child: Scaffold(
        appBar: appBarConfig?.appBar,
        body: Beamer(
          key: widget.beamerKey,
          routerDelegate: widget.router,
        ),
        bottomNavigationBar: _createBottomNavBar(_index),
      ),
    );
  }

  @override
  void dispose() {
    widget.router.removeListener(_setStateListener);
    super.dispose();
  }
}
