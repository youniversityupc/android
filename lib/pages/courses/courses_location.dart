import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:youniversity_app/layout/route_constants.dart';
import 'package:youniversity_app/pages/courses/course_page.dart';
import 'package:youniversity_app/pages/courses/courses_page.dart';
import 'package:youniversity_app/pages/courses/delegate_info_page.dart';
import 'package:youniversity_app/pages/courses/teacher_info_page.dart';
import 'package:youniversity_app/pages/grades/grades_detail_page.dart';
import 'package:youniversity_app/utils/no_transition_page.dart';

class CoursesLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final segments = state.pathPatternSegments;

    return [
      const NoTransitionPage(
        key: ValueKey(RouteConstants.courses),
        title: 'Cursos',
        child: CoursesPage(),
      ),
      if (segments.length > 1 && segments.last == 'details')
        const NoTransitionPage(
          key: ValueKey(RouteConstants.courseDetails),
          title: 'Detalle del curso',
          child: CoursePage(),
        ),
      if (segments.length > 1 && segments.last == 'teacher')
        const NoTransitionPage(
          key: ValueKey(RouteConstants.courseTeacher),
          title: 'Detalle del profesor',
          child: TeacherInfoPage(),
        ),
      if (segments.length > 1 && segments.last == 'delegate')
        const NoTransitionPage(
          key: ValueKey(RouteConstants.courseDelegate),
          title: 'Detalle del delegado',
          child: DelegateInfoPage(),
        ),
      if (segments.length > 1 && segments.last == 'grades')
        const NoTransitionPage(
          key: ValueKey(RouteConstants.courseGrades),
          title: 'Detalle de calificaciones',
          child: GradesDetailPage(),
        ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => [
        RouteConstants.coursesRoot,
        RouteConstants.coursesWildcard,
      ];
}
