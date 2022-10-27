import 'package:flutter/material.dart';
import 'package:youniversity_app/layout/app_location_item.dart';
import 'package:youniversity_app/layout/route_constants.dart';
import 'package:youniversity_app/pages/activities/activities_location.dart';
import 'package:youniversity_app/pages/auth/auth_location.dart';
import 'package:youniversity_app/pages/courses/courses_location.dart';
import 'package:youniversity_app/pages/home/home_location.dart';
import 'package:youniversity_app/pages/timetable/timetable_location.dart';

List<AppLocationItem> navigation = [
  AppLocationItem(
    title: 'Inicio',
    initialPath: RouteConstants.homeDashboard,
    location: HomeLocation(),
    navigation: const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Inicio',
    ),
    tabBar: AppLocationTabBar(
      items: [
        AppLocationTabBarItem.fromText(
          tab: 'Clases',
          path: RouteConstants.homeDashboard,
        ),
        AppLocationTabBarItem.fromText(
          tab: 'Hoy',
          path: RouteConstants.homeToday,
        ),
        AppLocationTabBarItem.fromText(
          tab: 'Dist. Horaria',
          path: RouteConstants.homeGraphs,
        ),
      ],
    ),
  ),
  AppLocationItem(
    title: 'Horario',
    initialPath: RouteConstants.timetable,
    location: TimetableLocation(),
    navigation: const BottomNavigationBarItem(
      icon: Icon(Icons.date_range),
      label: 'Horario',
    ),
  ),
  AppLocationItem(
    title: 'Cursos',
    initialPath: RouteConstants.courses,
    location: CoursesLocation(),
    navigation: const BottomNavigationBarItem(
      icon: Icon(Icons.book),
      label: 'Cursos',
    ),
  ),
  AppLocationItem(
    title: 'Actividades',
    initialPath: RouteConstants.activities,
    location: ActivitiesLocation(),
    navigation: const BottomNavigationBarItem(
      icon: Icon(Icons.list_alt),
      label: 'Actividades',
    ),
  ),
  AppLocationItem(
    title: 'Autenticación',
    initialPath: '/auth/signin',
    location: AuthLocation(),
    onlyBeamer: true,
  ),
];
