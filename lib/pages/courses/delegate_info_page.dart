import 'package:flutter/material.dart';
import 'package:youniversity_app/components/info_card.dart';
import 'package:youniversity_app/components/profile_avatar.dart';
import 'package:youniversity_app/utils/widget_list_extensions.dart';

class DelegateInfoPage extends StatelessWidget {
  const DelegateInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          ProfileAvatar(
            foregroundImage: const AssetImage('assets/dalb.jpg'),
          ),
          InfoCard(
            backgroundColor: Colors.lightBlue,
            foregroundColor: Colors.white,
            children: const [
              InfoCardItem(
                leading: Icon(Icons.account_circle),
                child: Text('Diego Albitres Blondet'),
              ),
              InfoCardItem(
                leading: Icon(Icons.email),
                child: Text('u202015652@upc.edu.pe'),
              ),
              InfoCardItem(
                leading: Icon(Icons.phone),
                child: Text('+51 999 999 999'),
              ),
            ],
          )
        ].withVerticalSpace(32),
      ),
    );
  }
}
