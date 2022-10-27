import 'package:flutter/material.dart';

class TabBarViewPage extends StatelessWidget {
  const TabBarViewPage({required this.pages, super.key});

  final List<Widget> pages;

  @override
  Widget build(BuildContext context) {
    final controller = DefaultTabController.of(context);
    final List<Widget> children =
        controller != null && controller.length == pages.length ? pages : [];

    return TabBarView(controller: controller, children: children);
  }
}
