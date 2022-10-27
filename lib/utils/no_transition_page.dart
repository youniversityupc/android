import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class NoTransitionPage extends BeamPage {
  const NoTransitionPage({
    super.key,
    required super.child,
    super.title,
    super.fullScreenDialog,
    super.opaque,
    super.keepQueryOnPop,
  });

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      fullscreenDialog: fullScreenDialog,
      opaque: opaque,
      settings: this,
      pageBuilder: (context, animation, secondaryAnimation) => child,
    );
  }
}
