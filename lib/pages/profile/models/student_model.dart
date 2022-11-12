 import 'package:flutter/material.dart';

@immutable
class StudentModel {
  final String photoPath;
  final String studentFullName;
  final String email;
  final String tel;
  final String college;

  const StudentModel({
    required this.photoPath,
    required this.studentFullName,
    required this.email,
    required this.tel,
    required this.college,
  });

  StudentModel copy({
    String? photoPath,
    String? studentFullName,
    String? email,
    String? tel,
    String? college,
  }) =>
      StudentModel(
        photoPath: photoPath ?? this.photoPath,
        studentFullName: studentFullName ?? this.studentFullName,
        email: email ?? this.email,
        tel: tel ?? this.tel,
        college: college ?? this.college,
      );

  static StudentModel fromJson(Map<String, dynamic> json) => StudentModel(
        photoPath: json['photoPath'],
        studentFullName: json['studentFullName'],
        email: json['email'],
        tel: json['tel'],
        college: json['college'],
      );

  Map<String, dynamic> toJson() => {
        'photoPath': photoPath,
        'studentFullName': studentFullName,
        'email': email,
        'tel': tel,
        'college': college,
      };
}
