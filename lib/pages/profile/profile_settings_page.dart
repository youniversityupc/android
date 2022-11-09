import 'package:flutter/material.dart';
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
        margin: const EdgeInsets.symmetric(vertical: 32),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            createAvatar(),
            createListItem(
              label: 'Nicola Casanova',
              icon: Icons.account_circle,
            ),
            createListItem(
              label: 'u201812345@upc.edu.pe',
              icon: Icons.email,
            ),
            createListItem(
              label: '+51 999 999 999',
              icon: Icons.phone,
            ),
            createListItem(
              label: 'Universidad Peruana de Ciencias Aplicadas',
              icon: Icons.school,
            ),
          ].withVerticalSpace(32),
        ),
      ),
    );
  }
}
