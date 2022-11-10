import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:youniversity_app/layout/route_constants.dart';
import 'package:youniversity_app/pages/courses/course_page.dart';
import 'package:youniversity_app/utils/no_transition_page.dart';

class CoursesLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      const NoTransitionPage(
        key: ValueKey(RouteConstants.courses),
        title: 'Cursos',
        child: CoursePage(),
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => [
        RouteConstants.coursesRoot,
        RouteConstants.coursesWildcard,
      ];
}
