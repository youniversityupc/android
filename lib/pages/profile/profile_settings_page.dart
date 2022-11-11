import 'package:flutter/material.dart';
import 'package:youniversity_app/components/info_card.dart';
import 'package:youniversity_app/components/profile_avatar.dart';
import 'package:youniversity_app/layout/app_theme.dart';
import 'package:youniversity_app/utils/build_context_extensions.dart';
import 'package:youniversity_app/utils/text_style_extensions.dart';
import 'package:youniversity_app/utils/widget_list_extensions.dart';

class ProfileSettingsPage extends StatefulWidget {
  const ProfileSettingsPage({super.key});

  @override
  State<ProfileSettingsPage> createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
  Widget createAvatar() {
    return const CircleAvatar(
      radius: 64,
      backgroundColor: AppColorPalette.secondaryColor,
      child: Icon(
        Icons.add_a_photo,
        color: AppColorPalette.primaryColor,
        size: 48,
      ),
    );
  }

  Widget createListItem({required String label, required IconData icon}) {
    final textStyle = context.textTheme.bodyLarge;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(icon, color: AppColorPalette.primaryColor),
        Text(label, style: textStyle?.withColor(AppColorPalette.primaryColor)),
      ].withHorizontalSpace(8),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          children: [
            ProfileAvatar(
              backgroundImage: const AssetImage('assets/dalb.jpg'),
              child: InkWell(onTap: () {}),
            ),
            InfoCard(
              backgroundColor: Colors.transparent,
              foregroundColor: AppColorPalette.primaryColor,
              elevation: 0,
              contentVerticalGap: 32,
              padding: EdgeInsets.zero,
              children: const [
                InfoCardItem(
                  leading: Icon(Icons.account_circle),
                  child: Text('Nicola Casanova'),
                ),
                InfoCardItem(
                  leading: Icon(Icons.email),
                  child: Text('u201812345@upc.edu.pe'),
                ),
                InfoCardItem(
                  leading: Icon(Icons.phone),
                  child: Text('+51 999 999 999'),
                ),
                InfoCardItem(
                  leading: Icon(Icons.school),
                  child: Text('Universidad Peruana de Ciencias Aplicadas'),
                ),
              ],
            ),
          ].withVerticalSpace(32),
        ),
      ),
    );
  }
}
