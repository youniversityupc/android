import 'package:flutter/material.dart';
import 'package:youniversity_app/utils/build_context_extensions.dart';
import 'package:youniversity_app/utils/widget_list_extensions.dart';
import 'package:youniversity_app/utils/text_style_extensions.dart';

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

  Widget createTextWithIcon(BuildContext context, String label, IconData icon) {
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
      color: backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              taskName,
              style: textTheme.headlineSmall?.withColor(Colors.white),
            ),
            createTextWithIcon(context, courseName, Icons.book),
            createTextWithIcon(context, remainingTime, Icons.schedule),
            createTextWithIcon(context, topicTheme, Icons.notes),
          ].withVerticalSpace(8),
        ),
      ),
    );
  }
}
