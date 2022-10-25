import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:youniversity_app/layout/app_layout.dart';

void main() => runApp(YOUniversityApp());

class YOUniversityApp extends StatelessWidget {
  YOUniversityApp({super.key});

  final routerDelegate = BeamerDelegate(
    initialPath: '/home',
    locationBuilder: RoutesLocationBuilder(
      routes: {
        '*': (_, __, ___) => AppLayout(),
      },
    ),
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'YOUniversity',
      debugShowCheckedModeBanner: false,
      color: const Color.fromRGBO(50, 106, 140, 1),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerDelegate: routerDelegate,
      routeInformationParser: BeamerParser(),
      backButtonDispatcher: BeamerBackButtonDispatcher(
        delegate: routerDelegate,
      ),
    );
  }
}
