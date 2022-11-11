import 'package:flutter/material.dart';
import 'package:youniversity_app/components/info_card.dart';
import 'package:youniversity_app/pages/courses/models/course_model.dart';
import 'package:youniversity_app/utils/build_context_extensions.dart';
import 'package:youniversity_app/utils/text_style_extensions.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({super.key});

  final List<CourseModel> _courses = const [
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
    CourseModel(
      courseName: 'IHC y Tecnologías Móviles',
      teacherName: 'Eder Ramiro Quispe Vílchez',
      frequency: 'Martes',
      backgroundColor: Colors.orange,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Expanded(
        child: Material(
          color: Colors.transparent,
          clipBehavior: Clip.antiAlias,
          child: ListView.separated(
            itemCount: _courses.length,
            itemBuilder: (context, index) {
              final course = _courses[index];
              return InfoCard(
                backgroundColor: course.backgroundColor,
                children: [
                  InfoCardItem(
                    child: Text(
                      course.courseName,
                      style: textTheme.headlineSmall?.withColor(Colors.white),
                    ),
                  ),
                  InfoCardItem(
                    leading: const Icon(Icons.badge),
                    child: Text(course.teacherName),
                  ),
                  InfoCardItem(
                    leading: const Icon(Icons.date_range),
                    child: Text(course.frequency),
                  ),
                ],
              );
            },
            separatorBuilder: (_, __) => const SizedBox(height: 16),
          ),
        ),
      ),
    );
  }
}
