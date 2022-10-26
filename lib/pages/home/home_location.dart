import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:youniversity_app/pages/home/home_courses_page.dart';

class HomeLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pathSegments = state.uri.pathSegments;
    final last = pathSegments.isNotEmpty ? pathSegments.last : null;
    return [
      if (last == 'dashboard')
        const BeamPage(
          key: ValueKey('/home/dashboard'),
          title: 'Clases',
          type: BeamPageType.noTransition,
          child: HomeCoursesPage(),
        ),
      if (last == 'today')
        const BeamPage(
          key: ValueKey('/home/today'),
          title: 'Hoy',
          type: BeamPageType.noTransition,
          child: Text('Hoy'),
        ),
      if (last == 'graphs')
        const BeamPage(
          key: ValueKey('/home/graphs'),
          title: 'Dist. Horaria',
          type: BeamPageType.noTransition,
          child: Text('Dist. Horaria'),
        ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ['/home/*'];
}
