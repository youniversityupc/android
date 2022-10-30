import 'package:flutter/material.dart';
import 'package:youniversity_app/models/activity_model.dart';
import 'package:youniversity_app/pages/activities/activity_form.dart';

class ActivityWidget extends StatelessWidget {
  ActivityWidget({super.key});

  final List<ActivityModel> _activities = [
    ActivityModel("Test Online", "Fisica 2", "Dentro de 30 minutos",
        "Reglas de Kirchoff", Colors.lightBlue),
    ActivityModel("Reunion Grupal", "IHC y Tecnologías Móviles",
        "Dentro de 2 horas", "Trabajo Parcial", Colors.orange),
    ActivityModel("Entrega de Trabajo Parcial", "Diseño de Base De Datos",
        "Dentro de 11 horas y 29 minutos", "Sprint 4", Colors.green),
    ActivityModel("Control Virtual 2", "Cálculo 2", "Dentro de 3 días",
        "Integrales triples", Colors.redAccent)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Activities",
              style: TextStyle(
                  fontFamily: "Roboto", fontSize: 20.5, color: Colors.white))),
      body: Center(
          child: Column(children: <Widget>[
        Container(
          margin: const EdgeInsetsDirectional.all(10.0),
          child: Column(children: const <Widget>[
            Text(
              "Esta semana",
              style: TextStyle(
                  fontFamily: "Arial", fontSize: 30.5, color: Colors.black54),
              textAlign: TextAlign.start,
            ),
            Text(
              "Tienes 2 actividades para esta semana",
              style: TextStyle(
                  fontFamily: "Arial", fontSize: 20.5, color: Colors.black54),
              textAlign: TextAlign.justify,
            ),
          ]),
        ),
        Expanded(
            child: ListView.builder(
                itemCount: _activities.length,
                itemBuilder: (BuildContext context, int index) {
                  ActivityModel act = _activities[index];
                  return Activity(
                      taskName: act.taskName,
                      courseName: act.courseName,
                      remainingTime: act.remainingTime,
                      topicTheme: act.topicTheme,
                      backgroundColor: act.backgroundColor);
                }))
      ])),
      floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 95, 55, 238),
          foregroundColor: Colors.white,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ActivityForm(onAddActivity: (ActivityModel data) {})));
          },
          child: const Icon(Icons.add)),
    );
  }
}

class Activity extends StatelessWidget {
  final String? taskName;
  final String? courseName;
  final String? remainingTime;
  final String? topicTheme;
  final Color? backgroundColor;
  const Activity(
      {Key? key,
      required this.taskName,
      required this.courseName,
      required this.remainingTime,
      required this.topicTheme,
      required this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      child: Column(children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 10.0),
          child: Text(taskName.toString(),
              style: const TextStyle(
                  fontFamily: "Roboto", fontSize: 25.5, color: Colors.white)),
        ),
        Container(
            margin: const EdgeInsets.all(15.0),
            child: Row(children: <Widget>[
              const Icon(Icons.task),
              Container(
                  margin: const EdgeInsets.only(left: 20.5),
                  child: Text(courseName.toString(),
                      style: const TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 14.5,
                          color: Colors.white)))
            ])),
        Container(
            margin: const EdgeInsets.all(15.0),
            child: Row(children: <Widget>[
              const Icon(Icons.timelapse),
              Container(
                  margin: const EdgeInsets.only(left: 20.5),
                  child: Text(remainingTime.toString(),
                      style: const TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 14.5,
                          color: Colors.white)))
            ])),
        Container(
            margin: const EdgeInsets.all(15.0),
            child: Row(children: <Widget>[
              const Icon(Icons.list_alt),
              Container(
                  margin: const EdgeInsets.only(left: 20.5),
                  child: Text(topicTheme.toString(),
                      style: const TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 14.5,
                          color: Colors.white)))
            ]))
      ]),
    );
  }
}
