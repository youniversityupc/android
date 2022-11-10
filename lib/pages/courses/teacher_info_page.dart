import 'package:flutter/material.dart';
import 'package:youniversity_app/components/info_card.dart';
import 'package:youniversity_app/components/profile_avatar.dart';
import 'package:youniversity_app/utils/widget_list_extensions.dart';

class TeacherInfoPage extends StatelessWidget {
  const TeacherInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          ProfileAvatar(
            foregroundImage: const AssetImage('assets/profe-quevedo.jpg'),
          ),
          InfoCard(
            backgroundColor: Colors.orange,
            foregroundColor: Colors.white,
            children: const [
              InfoCardItem(
                leading: Icon(Icons.badge_outlined),
                child: Text('David Gerardo Quevedo Velasco'),
              ),
              InfoCardItem(
                leading: Icon(Icons.email),
                child: Text('pcsidque@upc.edu.pe'),
              ),
            ],
          ),
        ].withVerticalSpace(32),
      ),
    );
  }
}
