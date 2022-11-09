import 'package:flutter/material.dart';
import 'package:youniversity_app/layout/app_theme.dart';
import 'package:youniversity_app/pages/grades/models/assignment_grade_model.dart';
import 'package:youniversity_app/utils/build_context_extensions.dart';
import 'package:youniversity_app/utils/widget_list_extensions.dart';
import 'package:youniversity_app/utils/text_style_extensions.dart';

class GradesInformation extends StatefulWidget {
  const GradesInformation({super.key});

  @override
  State<GradesInformation> createState() => _GradesInformationState();
}

class _GradesInformationState extends State<GradesInformation> {
  final List<AssignmentGradeModel> items = const [
    AssignmentGradeModel(label: 'TB1', percentage: 5, grade: 20),
    AssignmentGradeModel(label: 'TB2', percentage: 5, grade: 20),
    AssignmentGradeModel(label: 'TP1', percentage: 10, grade: 20),
    AssignmentGradeModel(label: 'EA1', percentage: 15, grade: 20),
    AssignmentGradeModel(label: 'TB3', percentage: 5),
    AssignmentGradeModel(label: 'TB4', percentage: 5),
    AssignmentGradeModel(label: 'TF1', percentage: 25),
    AssignmentGradeModel(label: 'EB1', percentage: 20),
    AssignmentGradeModel(label: 'EC1', percentage: 5),
    AssignmentGradeModel(label: 'PA1', percentage: 5),
  ];

  @override
  Widget build(BuildContext context) {
    final textStyle = context.textTheme.headlineSmall;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'IHC y Tecnologías Móviles',
            style: textStyle?.withColor(AppColorPalette.gray900),
          ),
          Expanded(
            child: Material(
              color: Colors.transparent,
              clipBehavior: Clip.antiAlias,
              child: ListView.separated(
                clipBehavior: Clip.antiAlias,
                itemBuilder: (context, index) {
                  final item = items[index];
                  final grade = item.grade?.toStringAsFixed(2);
                  return ListTile(
                    textColor: Colors.white,
                    tileColor: AppColorPalette.emerald400,
                    title: Text('${item.label} (${item.percentage}%)'),
                    trailing: Text(grade ?? '-'),
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemCount: items.length,
              ),
            ),
          ),
        ].withVerticalSpace(16),
      ),
    );
  }
}
