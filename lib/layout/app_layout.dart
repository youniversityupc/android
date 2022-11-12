import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:youniversity_app/components/profile_avatar.dart';
import 'package:youniversity_app/layout/app_location_item.dart';
import 'package:youniversity_app/layout/app_theme.dart';
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
  void Function()? _backButtonHandler;
  bool _showBackButton = false;

  Widget _createTitle() {
    final title = widget.navigation[_index].title.toUpperCase();
    return Text(title);
  }

  TabBar? _createTabBar() {
    final config = widget.navigation[_index].tabBar;
    if (config == null) return null;

    final items = config.items.map((e) => e.tab).toList();
    return TabBar(tabs: items);
  }

  void _handleBack() {
    widget.router.beamBack();
  }

  _AppBarConfig? _createAppBar() {
    final onlyBeamer = widget.navigation[_index].onlyBeamer;
    if (onlyBeamer) return null;

    final title = _createTitle();
    final tabBar = _createTabBar();
    final length = tabBar?.tabs.length ?? 0;

    bool showBack =
        _showBackButton && widget.router.beamingHistoryCompleteLength > 1;
    final backButton = BackButton(
      color: AppColorPalette.primaryColor,
      onPressed: _backButtonHandler ?? _handleBack,
    );

    final appBar = AppBar(
      leading: showBack ? backButton : null,
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

  BottomNavigationBar? _createBottomNavBar() {
    final onlyBeamer = widget.navigation[_index].onlyBeamer;
    if (onlyBeamer) return null;
    final items = _createBottomNavItemList();
    final current = _index >= 0 && _index < items.length ? _index : -1;
    return BottomNavigationBar(
      currentIndex: current == -1 ? 0 : current,
      selectedItemColor: current == -1
          ? Theme.of(context).bottomNavigationBarTheme.unselectedItemColor
          : null,
      onTap: _onNavBarItemTapped,
      items: items,
    );
  }

  void _onNavBarItemTapped(int index) {
    final path = widget.navigation[index].initialPath;
    widget.router.beamToNamed(
      path,
      replaceRouteInformation: true,
      popBeamLocationOnPop: false,
      beamBackOnPop: true,
      stacked: false,
    );
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

  void enableBackButton(void Function()? fn) {
    setState(() {
      _showBackButton = true;
      if (fn != null) _backButtonHandler = fn;
    });
  }

  void clearBackButton() {
    setState(() {
      _showBackButton = false;
      _backButtonHandler = null;
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
    final appBarConfig = _createAppBar();

    return DefaultTabController(
      length: appBarConfig?.length ?? 0,
      child: Scaffold(
        appBar: appBarConfig?.appBar,
        body: Beamer(
          key: widget.beamerKey,
          routerDelegate: widget.router,
        ),
        bottomNavigationBar: _createBottomNavBar(),
      ),
    );
  }

  @override
  void dispose() {
    widget.router.removeListener(_setStateListener);
    super.dispose();
  }
}
