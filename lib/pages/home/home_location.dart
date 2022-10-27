import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:youniversity_app/pages/home/home_courses_page.dart';
import 'package:youniversity_app/utils/tab_bar_view_page.dart';

class HomeLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      BeamPage(
        key: const ValueKey('/home'),
        title: 'Inicio',
        child: TabBarViewPage(
          pages: const [
            HomeCoursesPage(),
            Text('Hoy'),
            Text('Dist. Horaria'),
          ],
          paths: const [
            '/home/dashboard',
            '/home/today',
            '/home/graphs',
          ],
        ),
        type: BeamPageType.noTransition,
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ['/home', '/home/*'];
}
