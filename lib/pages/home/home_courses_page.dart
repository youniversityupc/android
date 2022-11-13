import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:youniversity_app/components/info_card.dart';
import 'package:youniversity_app/layout/app_theme.dart';
import 'package:youniversity_app/layout/route_constants.dart';
import 'package:youniversity_app/utils/build_context_extensions.dart';
import 'package:youniversity_app/utils/text_style_extensions.dart';
import 'package:youniversity_app/utils/widget_list_extensions.dart';

class HomeCoursesPage extends StatefulWidget {
  const HomeCoursesPage({super.key});

  @override
  State<HomeCoursesPage> createState() => _HomeCoursesPageState();
}

class _HomeCoursesPageState extends State<HomeCoursesPage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return SingleChildScrollView(
      child: Padding(
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
                children: [
                  GestureDetector(
                    onTap: () =>
                        context.beamToNamed(RouteConstants.courseDetails),
                    child: InfoCard(
                      backgroundColor: const Color.fromRGBO(251, 146, 60, 1),
                      title: const Text(
                        'Aplicaciones para Dispositivos Móviles',
                      ),
                      children: const [
                        InfoCardItem(
                          leading: Icon(Icons.room),
                          child: Text('Online'),
                        ),
                        InfoCardItem(
                          leading: Icon(Icons.schedule),
                          child: Text('Quedan 30 minutos'),
                        ),
                      ],
                    ),
                  ),
                  InfoCard(
                    backgroundColor: const Color.fromRGBO(248, 113, 113, 1),
                    title: const Text('Cálculo II'),
                    children: const [
                      InfoCardItem(
                        leading: Icon(Icons.room),
                        child: Text('Online'),
                      ),
                      InfoCardItem(
                        leading: Icon(Icons.schedule),
                        child: Text('Terminó hace 1 hora y 30 minutos'),
                      ),
                    ],
                  ),
                ].withVerticalSpace(16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
