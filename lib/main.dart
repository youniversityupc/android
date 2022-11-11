import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:youniversity_app/layout/app_layout.dart';
import 'package:youniversity_app/layout/app_navigation.dart';
import 'package:youniversity_app/layout/app_theme.dart';
import 'package:youniversity_app/layout/route_constants.dart';

void main() => runApp(YOUniversityApp(theme: theme));

class YOUniversityApp extends StatelessWidget {
  YOUniversityApp({super.key, required this.theme});

  final ThemeData theme;

  final routerDelegate = BeamerDelegate(
    initialPath: RouteConstants.authSignIn,
    transitionDelegate: const NoAnimationTransitionDelegate(),
    locationBuilder: RoutesLocationBuilder(
      routes: {
        '*': (_, __, ___) => AppLayout(navigation: navigation, initialIndex: 4),
      },
    ),
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BeamerProvider(
      routerDelegate: routerDelegate,
      child: MaterialApp.router(
        title: 'YOUniversity',
        debugShowCheckedModeBanner: false,
        theme: theme,
        routerDelegate: routerDelegate,
        routeInformationParser: BeamerParser(),
        backButtonDispatcher: BeamerBackButtonDispatcher(
          delegate: routerDelegate,
          alwaysBeamBack: true,
        ),
      ),
    );
  }
}
