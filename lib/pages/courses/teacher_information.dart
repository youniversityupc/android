import 'package:flutter/material.dart';
import 'package:youniversity_app/components/course_card.dart';
import 'package:youniversity_app/layout/app_theme.dart';

class TeacherInformation extends StatelessWidget {
  const TeacherInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 16),
            child: Column(
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/profe-quevedo.jpg'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.all(Radius.circular(120)),
                  ),
                ),
                const InformationCard(
                  color: AppColorPalette.primaryColor,
                  name: 'David Gerardo Quevedo Velasco',
                  email: 'pcsidque@upc.edu.pe',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
