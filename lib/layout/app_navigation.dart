import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:youniversity_app/layout/app_layout_navigation_item.dart';

class _TempLocation extends BeamLocation {
  @override
  List<BeamPage> buildPages(
      BuildContext context, RouteInformationSerializable state) {
    throw UnimplementedError();
  }

  @override
  List<Pattern> get pathPatterns => throw UnimplementedError();
}

var navigation = <AppLayoutNavigationItem>[
  AppLayoutNavigationItem.upper(
    title: 'Inicio',
    navigation: const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Inicio',
    ),
    beamLocation: _TempLocation(),
    tabBar: AppLayoutTabBar(
      items: <AppLayoutTabBarItem>[
        AppLayoutTabBarItem.fromText(
          tab: 'Clases',
          path: '/home/dashboard',
        ),
        AppLayoutTabBarItem.fromText(
          tab: 'Hoy',
          path: '/home/today',
        ),
        AppLayoutTabBarItem.fromText(
          tab: 'Dist. Horaria',
          path: '/home/graphs',
        ),
      ],
    ),
  ),
  AppLayoutNavigationItem(
    title: 'Horario',
    navigation: const BottomNavigationBarItem(
      icon: Icon(Icons.date_range),
      label: 'Horario',
    ),
    beamLocation: _TempLocation(),
  ),
  AppLayoutNavigationItem(
    title: 'Cursos',
    navigation: const BottomNavigationBarItem(
      icon: Icon(Icons.book),
      label: 'Cursos',
    ),
    beamLocation: _TempLocation(),
  ),
  AppLayoutNavigationItem(
    title: 'Actividades',
    navigation: const BottomNavigationBarItem(
      icon: Icon(Icons.list_alt),
      label: 'Actividades',
    ),
    beamLocation: _TempLocation(),
  ),
];
