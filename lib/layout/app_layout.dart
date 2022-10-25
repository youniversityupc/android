import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:youniversity_app/layout/app_bar_widget.dart';
import 'package:youniversity_app/layout/bottom_nav_bar_widget.dart';

class AppLayout extends StatelessWidget {
  AppLayout({super.key});

  final _beamerKey = GlobalKey<BeamerState>();
  final _routerDelegate = BeamerDelegate(
    locationBuilder: BeamerLocationBuilder(
      beamLocations: [],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        beamerKey: _beamerKey,
      ),
      body: Beamer(
        key: _beamerKey,
        routerDelegate: _routerDelegate,
      ),
      bottomNavigationBar: BottomNavBarWidget(
        beamerKey: _beamerKey,
      ),
    );
  }
}
