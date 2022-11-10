import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:youniversity_app/layout/route_constants.dart';
import 'package:youniversity_app/pages/home/home_courses_page.dart';
import 'package:youniversity_app/pages/home/home_today_page.dart';
import 'package:youniversity_app/utils/no_transition_page.dart';
import 'package:youniversity_app/utils/tab_bar_view_page.dart';

class HomeLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      NoTransitionPage(
        key: const ValueKey(RouteConstants.homeRoot),
        title: 'Inicio',
        child: TabBarViewPage(
          pages: const [
            HomeCoursesPage(),
            HomeTodayPage(),
            Text('Dist. Horaria'),
          ],
          paths: const [
            RouteConstants.homeDashboard,
            RouteConstants.homeToday,
            RouteConstants.homeGraphs,
          ],
        ),
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => [
        RouteConstants.homeRoot,
        RouteConstants.homeWildcard,
      ];
}
