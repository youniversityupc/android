import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:youniversity_app/layout/route_constants.dart';
import 'package:youniversity_app/pages/profile/profile_settings_page.dart';

class ProfileLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      const BeamPage(
        key: ValueKey(RouteConstants.profileRoot),
        title: 'Perfil',
        child: ProfileSettingsPage(),
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => [
        RouteConstants.profileRoot,
        RouteConstants.profileWildcard,
      ];
}
