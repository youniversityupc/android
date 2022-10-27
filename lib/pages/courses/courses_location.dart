import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:youniversity_app/utils/no_transition_page.dart';

class CoursesLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      const NoTransitionPage(
        key: ValueKey('/courses'),
        title: 'Cursos',
        child: Text('Cursos'),
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ['/courses', '/courses/*'];
}
