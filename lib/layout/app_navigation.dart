import 'package:flutter/material.dart';
import 'package:youniversity_app/layout/app_layout_navigation_item.dart';

var navigation = <AppLayoutNavigationItem>[
  AppLayoutNavigationItem(
    title: 'INICIO',
    navigation: const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Inicio',
    ),
    tabBar: AppLayoutTabBar(
      items: <Tab>[
        const Tab(text: 'CLASES'),
        const Tab(text: 'HOY'),
        const Tab(text: 'DIST. HORARIA'),
      ],
      children: [
        const Text('Clases'),
        const Text('Hoy'),
        const Text('Dist. Horaria'),
      ],
    ),
  ),
  const AppLayoutNavigationItem(
    title: 'HORARIO',
    navigation: BottomNavigationBarItem(
      icon: Icon(Icons.date_range),
      label: 'Horario',
    ),
    children: Text('Horario'),
  ),
  const AppLayoutNavigationItem(
    title: 'CURSOS',
    navigation: BottomNavigationBarItem(
      icon: Icon(Icons.book),
      label: 'Cursos',
    ),
    children: Text('Cursos'),
  ),
  const AppLayoutNavigationItem(
    title: 'ACTIVIDADES',
    navigation: BottomNavigationBarItem(
      icon: Icon(Icons.list_alt),
      label: 'Actividades',
    ),
    children: Text('Actividades'),
  ),
];
