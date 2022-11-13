import 'package:flutter/material.dart';
import 'package:youniversity_app/components/info_card.dart';
import 'package:youniversity_app/layout/app_theme.dart';
import 'package:youniversity_app/pages/activities/models/activity_model.dart';
import 'package:youniversity_app/utils/build_context_extensions.dart';
import 'package:youniversity_app/utils/text_style_extensions.dart';
import 'package:youniversity_app/utils/widget_list_extensions.dart';

class HomeTodayPage extends StatelessWidget {
  const HomeTodayPage({super.key});

  final List<ActivityModel> _todayActivies = const [
    ActivityModel(
      taskName: 'Reunion Grupal',
      courseName: 'IHC y Tecnologías Móviles',
      remainingTime: 'Dentro de 2 horas',
      topicTheme: 'Trabajo Parcial',
      backgroundColor: Colors.orange,
    ),
    ActivityModel(
      taskName: 'Test Online 3',
      courseName: 'Fisica 2',
      remainingTime: 'Dentro de 30 minutos',
      topicTheme: 'Reglas de Kirchoff',
      backgroundColor: Colors.lightBlue,
    ),
    ActivityModel(
      taskName: 'Entrega de Trabajo Parcial',
      courseName: 'Diseño de Base De Datos',
      remainingTime: 'Dentro de 11 horas y 29 minutos',
      topicTheme: 'Sprint 4',
      backgroundColor: Colors.green,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tu resumen diario',
                style: textTheme.headlineMedium
                    ?.withColor(AppColorPalette.gray900),
              ),
              Text(
                'Tienes ${_todayActivies.length} actividades para hoy',
                style:
                    textTheme.titleMedium?.withColor(AppColorPalette.gray700),
              ),
            ].withVerticalSpace(8),
          ),
          Expanded(
            child: Material(
              color: Colors.transparent,
              clipBehavior: Clip.antiAlias,
              child: ListView.separated(
                itemCount: _todayActivies.length,
                itemBuilder: (context, index) {
                  final todayActivity = _todayActivies[index];
                  return InfoCard(
                    backgroundColor: todayActivity.backgroundColor,
                    title: Text(todayActivity.taskName),
                    children: [
                      InfoCardItem(
                        leading: const Icon(Icons.book),
                        child: Text(
                          todayActivity.courseName,
                        ),
                      ),
                      InfoCardItem(
                        leading: const Icon(Icons.schedule),
                        child: Text(
                          todayActivity.remainingTime,
                        ),
                      ),
                      InfoCardItem(
                        leading: const Icon(Icons.notes),
                        child: Text(
                          todayActivity.topicTheme,
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(height: 16),
              ),
            ),
          )
        ].withVerticalSpace(16),
      ),
    );
  }
}
