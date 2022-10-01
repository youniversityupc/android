import 'package:flutter/material.dart';
import 'package:youniversity_app/layout/app_layout_navigation_item.dart';

class AppLayout extends StatefulWidget {
  final List<AppLayoutNavigationItem> navigation;
  final List<Widget> drawer;

  const AppLayout({
    super.key,
    required this.navigation,
    required this.drawer,
  });

  @override
  State<StatefulWidget> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  AppLayoutNavigationItem get _config {
    return widget.navigation[_selectedIndex];
  }

  @override
  void initState() {
    super.initState();

    var tabBar = _config.tabBar;
    if (tabBar != null) {
      tabBar.controller = TabController(
        length: tabBar.items.length,
        vsync: this,
      );
    }
  }

  @override
  void dispose() {
    var tabBar = _config.tabBar;
    if (tabBar != null) {
      var controller = tabBar.controller;
      if (controller != null) {
        controller.dispose();
        controller = null;
      }
    }

    super.dispose();
  }

  void _onItemTapped(int index) {
    if (index >= widget.navigation.length) {
      return;
    }

    setState(() {
      _selectedIndex = index;
    });
  }

  List<BottomNavigationBarItem> _createNavigation() {
    return widget.navigation.map((item) => item.navigation).toList();
  }

  TabBar? _createViewTabBar() {
    var tabBar = _config.tabBar;
    if (tabBar == null) {
      return null;
    }

    return TabBar(
      controller: tabBar.controller,
      tabs: tabBar.items,
      labelColor: const Color.fromRGBO(50, 106, 140, 1),
      unselectedLabelColor: const Color.fromRGBO(50, 106, 140, 1),
      indicatorColor: const Color.fromRGBO(50, 106, 140, 1),
    );
  }

  Widget? _createBody() {
    var tabBar = _config.tabBar;
    if (tabBar != null) {
      var controller = tabBar.controller;
      if (controller != null) {
        return TabBarView(
          controller: controller,
          children: tabBar.children,
        );
      }
    }
    return _config.children;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
      appBar: AppBar(
        title: Text(_config.title),
        bottom: _createViewTabBar(),
        backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
        foregroundColor: const Color.fromRGBO(50, 106, 140, 1),
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: widget.drawer,
        ),
      ),
      body: _createBody(),
      bottomNavigationBar: BottomNavigationBar(
        items: _createNavigation(),
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        currentIndex: _selectedIndex,
        backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
        selectedItemColor: const Color.fromRGBO(50, 106, 140, 1),
        onTap: _onItemTapped,
      ),
    );
  }
}
