import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:youniversity_app/pages/home/home_page.dart';

class HomeLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      const BeamPage(
        key: ValueKey('/home'),
        title: 'Inicio',
        child: HomePage(),
        type: BeamPageType.noTransition,
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ['/home', '/home/*'];
}
