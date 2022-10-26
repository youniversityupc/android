import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:youniversity_app/layout/app_bar_widget.dart';
import 'package:youniversity_app/layout/app_location_item.dart';
import 'package:youniversity_app/layout/bottom_nav_bar_widget.dart';

class AppLayout extends StatelessWidget {
  AppLayout({
    required List<AppLocationItem> navigation,
    super.key,
  })  : _navigation = navigation,
        _beamerKey = GlobalKey<BeamerState>(),
        _routerDelegate = BeamerDelegate(
          locationBuilder: BeamerLocationBuilder(
            beamLocations: [
              ...navigation.map((e) => e.beamLocation),
            ],
          ),
        );

  final List<AppLocationItem> _navigation;
  final GlobalKey<BeamerState> _beamerKey;
  final BeamerDelegate _routerDelegate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        beamerKey: _beamerKey,
        navigation: _navigation,
      ),
      body: Beamer(
        key: _beamerKey,
        routerDelegate: _routerDelegate,
      ),
      bottomNavigationBar: BottomNavBarWidget(
        beamerKey: _beamerKey,
        navigation: _navigation,
      ),
    );
  }
}
