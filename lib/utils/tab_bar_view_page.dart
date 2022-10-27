import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class TabBarViewPage extends StatefulWidget {
  const TabBarViewPage({
    required this.pages,
    required this.paths,
    super.key,
  }) : assert(pages.length == paths.length);

  final List<Widget> pages;
  final List<String> paths;

  @override
  State<TabBarViewPage> createState() => _TabBarViewPageState();
}

class _TabBarViewPageState extends State<TabBarViewPage> {
  late TabController _controller;
  late BeamerDelegate _router;

  bool _initialized = false;

  void _controllerListener() {
    int index = _controller.index;
    String? currentPath = _router.configuration.location;
    String newPath = widget.paths[index];

    if (newPath != currentPath) _router.beamToNamed(newPath);
  }

  void _routerListener() {
    String path = _router.configuration.location ?? '';
    int index = widget.paths.indexOf(path);
    // Whenever this is true, the change was managed by the controller.
    // Otherwise, we need to make the change manually.
    if (index == -1 || index == _controller.index) return;
    _controller.index = index;
  }

  void _setupRouting(BuildContext context) {
    if (_initialized) return;

    final controller = DefaultTabController.of(context);

    assert(() {
      if (controller == null) {
        throw FlutterError(
          'No TabController for ${widget.runtimeType}.\n'
          'When creating a ${widget.runtimeType}, or you must ensure that there '
          'is a DefaultTabController above the ${widget.runtimeType}.\n',
        );
      }
      return true;
    }());

    controller!.addListener(_controllerListener);

    final router = Beamer.of(context);
    router.addListener(_routerListener);

    setState(() {
      _controller = controller;
      _router = router;
      _initialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    _setupRouting(context);

    final controller = DefaultTabController.of(context);
    final List<Widget> children =
        controller != null && controller.length == widget.pages.length
            ? widget.pages
            : [];

    return TabBarView(controller: controller, children: children);
  }

  @override
  void dispose() {
    _controller.removeListener(_controllerListener);
    _router.removeListener(_routerListener);
    super.dispose();
  }
}
