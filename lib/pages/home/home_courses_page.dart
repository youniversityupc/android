import 'package:flutter/material.dart';
import 'package:youniversity_app/components/course_card.dart';

class HomeCoursesPage extends StatefulWidget {
  const HomeCoursesPage({super.key});

  @override
  State<HomeCoursesPage> createState() => _HomeCoursesPageState();
}

class _HomeCoursesPageState extends State<HomeCoursesPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hola, Nicola',
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(color: const Color.fromRGBO(24, 24, 27, 1)),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              '30 minutos restantes de tu última clase',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  ?.copyWith(color: const Color.fromRGBO(63, 63, 70, 1)),
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
