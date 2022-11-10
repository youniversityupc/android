import 'package:flutter/material.dart';
import 'package:youniversity_app/components/info_card.dart';
import 'package:youniversity_app/pages/courses/models/course_model.dart';
import 'package:youniversity_app/utils/build_context_extensions.dart';
import 'package:youniversity_app/utils/text_style_extensions.dart';

class CourseCard extends StatelessWidget {
  final CourseModel course;

  const CourseCard({
    super.key,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return InfoCard(
      backgroundColor: course.backgroundColor,
      foregroundColor: Colors.white,
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
  }
}
