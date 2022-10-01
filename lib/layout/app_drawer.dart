import 'package:flutter/material.dart';

const drawer = <Widget>[
  DrawerHeader(
    child: Text(
      'YOUniversity',
      style: TextStyle(
        color: Colors.black,
        fontSize: 24,
      ),
    ),
  ),
  ListTile(
    leading: Icon(Icons.settings),
    title: Text('Settings'),
  ),
];
