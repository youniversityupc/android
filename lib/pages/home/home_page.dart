import 'package:flutter/material.dart';
import 'package:youniversity_app/pages/home/home_courses_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const pages = [
    HomeCoursesPage(),
    Text('Hoy'),
    Text('Dist. Horaria'),
  ];

  @override
  Widget build(BuildContext context) {
    final controller = DefaultTabController.of(context);
    final List<Widget> children =
        controller != null && controller.length == pages.length ? pages : [];

    return TabBarView(controller: controller, children: children);
  }
}
