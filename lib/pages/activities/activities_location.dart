import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:youniversity_app/layout/route_constants.dart';
import 'package:youniversity_app/pages/activities/activity_form.dart';
import 'package:youniversity_app/pages/activities/activity_page.dart';
import 'package:youniversity_app/utils/no_transition_page.dart';

class ActivitiesLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final location = state.routeInformation.location;
    return [
      NoTransitionPage(
        key: const ValueKey(RouteConstants.activities),
        title: 'Actividades',
        child: ActivityPage(),
      ),
      if (location == RouteConstants.activitiesCreate)
        const NoTransitionPage(
          key: ValueKey(RouteConstants.activitiesCreate),
          title: 'Crear actividad',
          child: ActivityForm(),
        )
    ];
  }

  @override
  List<Pattern> get pathPatterns => [
        RouteConstants.activitiesRoot,
        RouteConstants.activitiesWildcard,
      ];
}
