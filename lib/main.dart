import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youniversity_app/views/profile_setting_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme:  GoogleFonts.poppinsTextTheme(textTheme),
      ),
      home: const ProfileSettingScreen(),
    );
  }
}

