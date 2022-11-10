import 'package:flutter/material.dart';
import 'package:youniversity_app/layout/app_theme.dart';
import 'package:youniversity_app/pages/activities/components/activity_card.dart';
import 'package:youniversity_app/pages/activities/models/activity_model.dart';
import 'package:youniversity_app/utils/build_context_extensions.dart';
import 'package:youniversity_app/utils/text_style_extensions.dart';
import 'package:youniversity_app/utils/widget_list_extensions.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});

  final List<ActivityModel> _activities = const [
    ActivityModel(
      taskName: 'Test Online',
      courseName: 'Fisica 2',
      remainingTime: 'Dentro de 30 minutos',
      topicTheme: 'Reglas de Kirchoff',
      backgroundColor: Colors.lightBlue,
    ),
    ActivityModel(
      taskName: 'Reunion Grupal',
      courseName: 'IHC y Tecnologías Móviles',
      remainingTime: 'Dentro de 2 horas',
      topicTheme: 'Trabajo Parcial',
      backgroundColor: Colors.orange,
    ),
    ActivityModel(
      taskName: 'Entrega de Trabajo Parcial',
      courseName: 'Diseño de Base De Datos',
      remainingTime: 'Dentro de 11 horas y 29 minutos',
      topicTheme: 'Sprint 4',
      backgroundColor: Colors.green,
    ),
    ActivityModel(
      taskName: 'Control Virtual 2',
      courseName: 'Cálculo 2',
      remainingTime: 'Dentro de 3 días',
      topicTheme: 'Integrales triples',
      backgroundColor: Colors.redAccent,
    )
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
                'Esta semana',
                style: textTheme.headlineMedium
                    ?.withColor(AppColorPalette.gray900),
              ),
              Text(
                'Tienes ${_activities.length} actividades para esta semana',
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
                itemCount: _activities.length,
                itemBuilder: (context, index) {
                  final activity = _activities[index];
                  return ActivityCard(
                    activity: activity,
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
