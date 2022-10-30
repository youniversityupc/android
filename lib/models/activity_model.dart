import 'package:flutter/material.dart';

class ActivityModel {
  String? taskName;
  String? courseName;
  String? remainingTime;
  String? topicTheme;
  Color? backgroundColor;

  ActivityModel(this.taskName, this.courseName, this.remainingTime,
      this.topicTheme, this.backgroundColor);
}
