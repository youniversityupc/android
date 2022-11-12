import 'package:flutter/material.dart';
import 'package:youniversity_app/layout/app_theme.dart';
import 'package:youniversity_app/pages/profile/profile_settings_edit_page.dart';
import 'package:youniversity_app/utils/build_context_extensions.dart';
import 'package:youniversity_app/utils/text_style_extensions.dart';
import 'package:youniversity_app/utils/widget_list_extensions.dart';
import 'package:youniversity_app/widgets/profile_widget.dart';

import '../../utils/user_preferences.dart';

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
    const user = UserPreferences.myUser;
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 32),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            ProfileWidget(
              photoPath: user.photoPath,
              onClicked: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const ProfileSettingsEditPage()),
                );
              },
            ),
            createListItem(
              label: user.studentFullName,
              icon: Icons.account_circle,
            ),
            createListItem(
              label: user.email,
              icon: Icons.email,
            ),
            createListItem(
              label: user.tel,
              icon: Icons.phone,
            ),
            createListItem(
              label: user.college,
              icon: Icons.school,
            ),
          ].withVerticalSpace(32),
        ),
      ),
    );
  }
}
