import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:youniversity_app/pages/home/home_courses_page.dart';
import 'package:youniversity_app/utils/tab_bar_view_page.dart';

class HomeLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      const BeamPage(
        key: ValueKey('/home'),
        title: 'Inicio',
        child: TabBarViewPage(pages: [
          HomeCoursesPage(),
          Text('Hoy'),
          Text('Dist. Horaria'),
        ]),
        type: BeamPageType.noTransition,
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ['/home', '/home/*'];
}
