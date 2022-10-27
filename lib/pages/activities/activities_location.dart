import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:youniversity_app/utils/no_transition_page.dart';

class ActivitiesLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      const NoTransitionPage(
        key: ValueKey('/activities'),
        title: 'Actividades',
        child: Text('Actividades'),
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ['/activities', '/activities/*'];
}
