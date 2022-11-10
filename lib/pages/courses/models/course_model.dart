import 'package:flutter/material.dart';

@immutable
class CourseModel {
  final String courseName;
  final String teacherName;
  final String frequency;
  final Color backgroundColor;

  const CourseModel({
    required this.courseName,
    required this.teacherName,
    required this.frequency,
    required this.backgroundColor,
  });
}
