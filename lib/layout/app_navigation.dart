import 'package:flutter/material.dart';
import 'package:youniversity_app/layout/app_location_item.dart';
import 'package:youniversity_app/pages/home/home_location.dart';
import 'package:youniversity_app/utils/not_found_location.dart';

List<AppLocationItem> navigation = [
  AppLocationItem(
    title: 'Inicio',
    initialPath: '/home/dashboard',
    beamLocation: HomeLocation(),
    navigation: const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Inicio',
    ),
    tabBar: AppLocationTabBar(
      items: [
        AppLocationTabBarItem.fromText(
          tab: 'Clases',
          path: '/home/dashboard',
        ),
        AppLocationTabBarItem.fromText(
          tab: 'Hoy',
          path: '/home/today',
        ),
        AppLocationTabBarItem.fromText(
          tab: 'Dist. Horaria',
          path: '/home/graphs',
        ),
      ],
    ),
  ),
  AppLocationItem(
    title: 'Horario',
    initialPath: '/timetable',
    beamLocation: NotFoundLocation(
      path: '/timetable',
      child: const Text('Horario'),
    ),
    navigation: const BottomNavigationBarItem(
      icon: Icon(Icons.date_range),
      label: 'Horario',
    ),
  ),
  AppLocationItem(
    title: 'Cursos',
    initialPath: '/courses',
    beamLocation: NotFoundLocation(
      path: '/courses',
      child: const Text('Cursos'),
    ),
    navigation: const BottomNavigationBarItem(
      icon: Icon(Icons.book),
      label: 'Cursos',
    ),
  ),
  AppLocationItem(
    title: 'Actividades',
    initialPath: '/activities',
    beamLocation: NotFoundLocation(
      path: '/activities',
      child: const Text('Actividades'),
    ),
    navigation: const BottomNavigationBarItem(
      icon: Icon(Icons.list_alt),
      label: 'Actividades',
    ),
  ),
];
