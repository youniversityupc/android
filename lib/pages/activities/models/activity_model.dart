import 'package:flutter/material.dart';

@immutable
class ActivityModel {
  final String taskName;
  final String courseName;
  final String remainingTime;
  final String topicTheme;
  final Color backgroundColor;

  const ActivityModel({
    required this.taskName,
    required this.courseName,
    required this.remainingTime,
    required this.topicTheme,
    required this.backgroundColor,
  });
}
