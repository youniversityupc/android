import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:youniversity_app/layout/app_location_item.dart';

class BottomNavBarWidget extends StatefulWidget {
  BottomNavBarWidget({
    required this.beamerKey,
    required List<AppLocationItem> navigation,
    super.key,
  }) : navigation = _filterNavigation(navigation);

  static List<AppLocationItem> _filterNavigation(List<AppLocationItem> items) {
    return items.where((e) => e.navigation != null).toList();
  }

  final GlobalKey<BeamerState> beamerKey;
  final List<AppLocationItem> navigation;

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  late BeamerDelegate _beamerDelegate;

  int get _currentIndex =>
      widget.navigation.indexWhere((element) => element.beamLocation.isCurrent);

  void _onItemTapped(int index) {
    _beamerDelegate.beamToNamed(widget.navigation[index].initialPath);
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
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      items: widget.navigation.map((e) => e.navigation!).toList(),
      onTap: _onItemTapped,
      showSelectedLabels: true,
      type: BottomNavigationBarType.fixed,
    );
  }

  @override
  void dispose() {
    _beamerDelegate.removeListener(_setStateListener);
    super.dispose();
  }
}
