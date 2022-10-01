import 'package:flutter/material.dart';
import 'package:youniversity_app/layout/app_drawer.dart';
import 'package:youniversity_app/layout/app_layout.dart';
import 'package:youniversity_app/layout/app_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YOUniversity',
      debugShowCheckedModeBanner: false,
      color: const Color.fromRGBO(50, 106, 140, 1),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AppLayout(
        navigation: navigation,
        drawer: drawer,
      ),
    );
  }
}
