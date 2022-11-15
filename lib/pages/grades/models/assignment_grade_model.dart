import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class AssignmentGradeModel extends Equatable {
  final String label;
  final int percentage;
  final double? grade;

  const AssignmentGradeModel({
    required this.label,
    required this.percentage,
    this.grade,
  }) : assert(percentage >= 0 && percentage <= 100,
            'Invalid percentage given for AssignmentGradeModel: $percentage');

  AssignmentGradeModel copyWith({
    String? label,
    int? percentage,
    double? grade,
  }) {
    return AssignmentGradeModel(
      label: label ?? this.label,
      percentage: percentage ?? this.percentage,
      grade: grade ?? this.grade,
    );
  }

  @override
  List<Object?> get props => [label, percentage, grade];
}
