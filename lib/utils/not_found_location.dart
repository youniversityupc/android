import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class NotFoundLocation extends BeamLocation<BeamState> {
  final String path;
  final Widget child;

  NotFoundLocation({required this.path, required this.child});

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        BeamPage(
          key: ValueKey(path),
          child: child,
          type: BeamPageType.noTransition,
        ),
      ];

  @override
  List<Pattern> get pathPatterns => [path];
}
