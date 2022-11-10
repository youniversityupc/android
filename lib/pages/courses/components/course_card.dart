import 'package:flutter/material.dart';
import 'package:youniversity_app/pages/courses/models/course_model.dart';
import 'package:youniversity_app/utils/build_context_extensions.dart';
import 'package:youniversity_app/utils/widget_list_extensions.dart';
import 'package:youniversity_app/utils/text_style_extensions.dart';

class CourseCard extends StatelessWidget {
  final CourseModel course;

  const CourseCard({
    super.key,
    required this.course,
  });

  Widget courseInformation(BuildContext context, String label, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: Colors.white),
        Text(
          label,
          style: context.textTheme.bodyLarge?.withColor(Colors.white),
        ),
      ].withHorizontalSpace(8),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return Card(
      color: course.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              course.courseName,
              style: textTheme.headlineSmall?.withColor(Colors.white),
            ),
            courseInformation(context, course.teacherName, Icons.badge),
            courseInformation(context, course.frequency, Icons.date_range),
          ].withVerticalSpace(8),
        ),
      ),
    );
  }
}
