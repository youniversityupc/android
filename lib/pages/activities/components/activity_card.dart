import 'package:flutter/material.dart';
import 'package:youniversity_app/components/info_card.dart';
import 'package:youniversity_app/pages/activities/models/activity_model.dart';
import 'package:youniversity_app/utils/build_context_extensions.dart';
import 'package:youniversity_app/utils/text_style_extensions.dart';

class ActivityCard extends StatelessWidget {
  final ActivityModel activity;

  const ActivityCard({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return InfoCard(
      backgroundColor: activity.backgroundColor,
      foregroundColor: Colors.white,
      children: [
        InfoCardItem(
          child: Text(
            activity.taskName,
            style: textTheme.headlineSmall?.withColor(Colors.white),
          ),
        ),
        InfoCardItem(
          leading: const Icon(Icons.book),
          child: Text(
            activity.courseName,
          ),
        ),
        InfoCardItem(
          leading: const Icon(Icons.schedule),
          child: Text(
            activity.remainingTime,
          ),
        ),
        InfoCardItem(
          leading: const Icon(Icons.notes),
          child: Text(
            activity.topicTheme,
          ),
        ),
      ],
    );
  }
}
