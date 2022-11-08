import 'package:flutter/material.dart';
import 'package:youniversity_app/components/course_card.dart';
import 'package:youniversity_app/layout/app_theme.dart';
import 'package:youniversity_app/utils/build_context_extensions.dart';
import 'package:youniversity_app/utils/text_style_extensions.dart';

class HomeCoursesPage extends StatefulWidget {
  const HomeCoursesPage({super.key});

  @override
  State<HomeCoursesPage> createState() => _HomeCoursesPageState();
}

class _HomeCoursesPageState extends State<HomeCoursesPage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hola, Nicola',
            style: textTheme.headline4?.withColor(AppColorPalette.gray900),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              '30 minutos restantes de tu última clase',
              style: textTheme.subtitle1?.withColor(AppColorPalette.gray700),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CourseCard(
                  color: Color.fromRGBO(251, 146, 60, 1),
                  title: 'IHC y Tecnología Móviles',
                  location: 'Online',
                  time: 'Quedan 30 minutos',
                ),
                SizedBox(height: 8),
                CourseCard(
                  color: Color.fromRGBO(248, 113, 113, 1),
                  title: 'Cálculo II',
                  location: 'Online',
                  time: 'Terminó hace 1 hora y 30 minutos',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
