import 'package:flutter/material.dart';

class ActivityModel {
  String taskName;
  String courseName;
  String remainingTime;
  String topicTheme;
  Color backgroundColor;

  ActivityModel({
    required this.taskName,
    required this.courseName,
    required this.remainingTime,
    required this.topicTheme,
    required this.backgroundColor,
  });
}
