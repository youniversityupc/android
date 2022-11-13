import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:youniversity_app/components/info_card.dart';
import 'package:youniversity_app/layout/app_theme.dart';
import 'package:youniversity_app/layout/route_constants.dart';
import 'package:youniversity_app/utils/build_context_extensions.dart';
import 'package:youniversity_app/utils/text_style_extensions.dart';
import 'package:youniversity_app/utils/widget_list_extensions.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({super.key});

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
              'Aplicaciones para Dispositivos Móviles',
              style: textTheme.headline5?.withColor(AppColorPalette.gray900),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () =>
                        context.beamToNamed(RouteConstants.courseTeacher),
                    child: InfoCard(
                      backgroundColor: const Color.fromRGBO(251, 146, 60, 1),
                      title: const Text('Profesor'),
                      children: const [
                        InfoCardItem(
                          leading: Icon(Icons.badge),
                          child: Text('David Gerardo Quevedo Velasco'),
                        ),
                        InfoCardItem(
                          leading: Icon(Icons.email),
                          child: Text('pcsidque@upc.edu.pe'),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () =>
                        context.beamToNamed(RouteConstants.courseDelegate),
                    child: InfoCard(
                      backgroundColor: const Color.fromRGBO(96, 165, 250, 1),
                      title: const Text('Delegado'),
                      children: const [
                        InfoCardItem(
                          leading: Icon(Icons.account_circle),
                          child: Text('Diego Albitres Blondet'),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () =>
                        context.beamToNamed(RouteConstants.courseGrades),
                    child: InfoCard(
                      backgroundColor: const Color.fromRGBO(52, 211, 153, 1),
                      title: const Text('Calificaciones'),
                      children: const [
                        InfoCardItem(
                          trailing: Text('7.00'),
                          child: Text('Calificación del curso al 35%'),
                        ),
                      ],
                    ),
                  ),
                  InfoCard(
                    backgroundColor: const Color.fromRGBO(248, 113, 113, 1),
                    title: const Text('Próximos eventos'),
                    children: const [
                      InfoCardItem(
                        leading: Icon(Icons.date_range),
                        child: Text('Clase dentro de 7 días'),
                      ),
                      InfoCardItem(
                        leading: Icon(Icons.book),
                        child: Text('Trabajo expira en 2 semanas'),
                      ),
                      InfoCardItem(
                        leading: Icon(Icons.book),
                        child: Text('Actividad expira en 2 semanas'),
                      ),
                      InfoCardItem(
                        leading: Icon(Icons.date_range),
                        child: Text('Clase dentro de 2 semanas'),
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
