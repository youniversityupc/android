import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youniversity_app/layout/app_layout.dart';
import 'package:youniversity_app/layout/app_navigation.dart';
import 'package:youniversity_app/layout/app_theme.dart';
import 'package:youniversity_app/layout/route_constants.dart';
import 'package:youniversity_app/pages/auth/bloc/auth_bloc.dart';
import 'package:youniversity_app/pages/auth/repository/auth_repository.dart';

void main() {
  runApp(
    YOUniversityApp(
      theme: theme,
      authRepository: AuthRepository(),
    ),
  );
}

class YOUniversityApp extends StatelessWidget {
  YOUniversityApp({
    super.key,
    required this.theme,
    required this.authRepository,
  });

  final ThemeData theme;
  final AuthRepository authRepository;

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
    return RepositoryProvider.value(
      value: authRepository,
      child: BlocProvider(
        create: (_) => AuthBloc(authRepository: authRepository),
        child: BeamerProvider(
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
        ),
      ),
    );
  }
}
