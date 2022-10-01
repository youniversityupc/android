import 'package:flutter/material.dart';

class ActivityWidget extends StatelessWidget {
  const ActivityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Activities", style: TextStyle(fontFamily: "Roboto", fontSize: 20.5, color: Colors.white))
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsetsDirectional.all(10.0),
              child: Column(
                children: const <Widget> [
                  Text("Esta semana", style: TextStyle(fontFamily: "Arial", fontSize: 30.5, color: Colors.black54), textAlign: TextAlign.start,),
                  Text("Tienes 2 actividades para esta semana", style: TextStyle(fontFamily: "Arial", fontSize: 20.5, color: Colors.black54), textAlign: TextAlign.justify,),
                ]
              ),
            ),
            const Activity(taskName: "Test Online", courseName: "Fisica 2", remainingTime: "Dentro de 30 minutos", topicTheme: "Reglas de Kirchoff", backgroundColor: Colors.lightBlue),
            const Activity(taskName: "Reunion Grupal", courseName: "IHC y Tecnologías Móviles", remainingTime: "Dentro de 2 horas", topicTheme: "Trabajo Parcial", backgroundColor: Colors.green)
          ]
        )
      )
    );
  }

}

class Activity extends StatelessWidget {
  final String taskName;
  final String courseName;
  final String remainingTime;
  final String topicTheme;
  final Color backgroundColor;
  const Activity(
  {
    Key? key,
    required this.taskName,
    required this.courseName,
    required this.remainingTime,
    required this.topicTheme,
    required this.backgroundColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Text(taskName, style: const TextStyle(fontFamily: "Roboto", fontSize: 25.5, color: Colors.white)),
          ),
          Container(
            margin: const EdgeInsets.all(15.0),
            child: Row(
                      children: <Widget>[
                        const Icon(Icons.task),
                        Container(
                          margin: const EdgeInsets.only(left: 20.5),
                          child: Text(courseName, style: const TextStyle(fontFamily: "Roboto", fontSize: 14.5, color: Colors.white))
                        )
                      ]
                    )
          ),
          Container(
            margin: const EdgeInsets.all(15.0),
            child: Row(
                      children: <Widget>[
                        const Icon(Icons.timelapse),
                        Container(
                          margin: const EdgeInsets.only(left: 20.5),
                          child: Text(remainingTime, style: const TextStyle(fontFamily: "Roboto", fontSize: 14.5, color: Colors.white))
                        )
                      ]
                    )
          ),
          Container(
            margin: const EdgeInsets.all(15.0),
            child: Row(
                      children: <Widget>[
                        const Icon(Icons.list_alt),
                        Container(
                          margin: const EdgeInsets.only(left: 20.5),
                          child: Text(topicTheme, style: const TextStyle(fontFamily: "Roboto", fontSize: 14.5, color: Colors.white))
                        )
                      ]
                    )
          )
        ]),
    );
  }
}