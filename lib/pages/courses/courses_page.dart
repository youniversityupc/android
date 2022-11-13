import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:youniversity_app/components/info_card.dart';
import 'package:youniversity_app/layout/route_constants.dart';
import 'package:youniversity_app/pages/courses/models/course_model.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  final List<CourseModel> _courses = const [
    CourseModel(
      courseName: 'Aplicaciones para Dispositivos Móviles',
      teacherName: 'David Gerardo Quevedo Velasco',
      frequency: 'Martes',
      backgroundColor: Colors.orange,
    ),
    CourseModel(
        courseName: 'Cálculo II',
        teacherName: 'Luis Ronald Príncipe Jiménez',
        frequency: 'Martes, Viernes',
        backgroundColor: Colors.red),
    CourseModel(
      courseName: 'Diseño de Bases de Datos',
      teacherName: 'Javier Ulises Rosales Huamanchumo',
      frequency: 'Miércoles, Viernes',
      backgroundColor: Colors.green,
    ),
    CourseModel(
      courseName: 'Física II',
      teacherName: 'José Augusto Truyenque Tanaka',
      frequency: 'Lunes, Miércoles, Jueves',
      backgroundColor: Colors.lightBlue,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Material(
        color: Colors.transparent,
        clipBehavior: Clip.antiAlias,
        child: ListView.separated(
          itemCount: _courses.length,
          itemBuilder: (context, index) {
            final course = _courses[index];
            return GestureDetector(
              onTap: () => context.beamToNamed(RouteConstants.courseDetails),
              child: InfoCard(
                backgroundColor: course.backgroundColor,
                title: Text(course.courseName),
                children: [
                  InfoCardItem(
                    leading: const Icon(Icons.badge),
                    child: Text(course.teacherName),
                  ),
                  InfoCardItem(
                    leading: const Icon(Icons.date_range),
                    child: Text(course.frequency),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (_, __) => const SizedBox(height: 16),
        ),
      ),
    );
  }
}
