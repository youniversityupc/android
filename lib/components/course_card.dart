import 'package:flutter/material.dart';
import 'package:youniversity_app/utils/text_style_extensions.dart';

class _CourseIcon extends StatelessWidget {
  final Icon icon;
  final String label;

  const _CourseIcon({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 8),
          child: icon,
        ),
        Text(
          label,
          style: textTheme.bodyLarge?.withColor(Colors.white),
        ),
      ],
    );
  }
}

class CourseCard extends StatelessWidget {
  final Color? color;
  final String title;
  final String location;
  final String time;

  const CourseCard({
    super.key,
    this.color,
    required this.title,
    required this.location,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: textTheme.headlineSmall?.withColor(Colors.white),
            ),
            Container(
              margin: const EdgeInsets.only(top: 8),
              child: Column(
                children: [
                  _CourseIcon(
                    icon: const Icon(Icons.location_pin, color: Colors.white),
                    label: location,
                  ),
                  const SizedBox(height: 4),
                  _CourseIcon(
                    icon: const Icon(Icons.schedule, color: Colors.white),
                    label: time,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
