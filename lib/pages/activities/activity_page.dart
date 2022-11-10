import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:youniversity_app/layout/route_constants.dart';
import 'package:youniversity_app/pages/activities/models/activity_model.dart';

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
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsetsDirectional.all(10.0),
              child: Column(
                children: const <Widget>[
                  Text(
                    'Esta semana',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 30.5,
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    'Tienes 2 actividades para esta semana',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 20.5,
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _activities.length,
                itemBuilder: (context, index) {
                  final act = _activities[index];
                  return ActivityCard(
                    taskName: act.taskName,
                    courseName: act.courseName,
                    remainingTime: act.remainingTime,
                    topicTheme: act.topicTheme,
                    backgroundColor: act.backgroundColor,
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 95, 55, 238),
        foregroundColor: Colors.white,
        onPressed: () {
          Beamer.of(context).beamToNamed(RouteConstants.activitiesCreate);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ActivityCard extends StatelessWidget {
  final String taskName;
  final String courseName;
  final String remainingTime;
  final String topicTheme;
  final Color backgroundColor;

  const ActivityCard({
    super.key,
    required this.taskName,
    required this.courseName,
    required this.remainingTime,
    required this.topicTheme,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Text(
              taskName,
              style: const TextStyle(
                fontFamily: 'Roboto',
                fontSize: 25.5,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(15.0),
            child: Row(
              children: <Widget>[
                const Icon(Icons.task),
                Container(
                  margin: const EdgeInsets.only(left: 20.5),
                  child: Text(
                    courseName.toString(),
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14.5,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(15.0),
            child: Row(
              children: <Widget>[
                const Icon(Icons.timelapse),
                Container(
                  margin: const EdgeInsets.only(left: 20.5),
                  child: Text(
                    remainingTime.toString(),
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14.5,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(15.0),
            child: Row(
              children: <Widget>[
                const Icon(Icons.list_alt),
                Container(
                  margin: const EdgeInsets.only(left: 20.5),
                  child: Text(
                    topicTheme.toString(),
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14.5,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
