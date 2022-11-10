import 'package:flutter/material.dart';
import 'package:youniversity_app/components/profile_avatar.dart';
import 'package:youniversity_app/utils/widget_list_extensions.dart';

class CreateTeacherPage extends StatefulWidget {
  const CreateTeacherPage({super.key});

  @override
  State<CreateTeacherPage> createState() => _CreateTeacherPageState();
}

class _CreateTeacherPageState extends State<CreateTeacherPage> {
  Widget createTextInput({
    required String label,
    String? hint,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
  }) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
      ),
      keyboardType: keyboardType,
      obscureText: obscureText,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          ProfileAvatar(
            backgroundImage: const AssetImage('assets/profe-quevedo.jpg'),
            child: InkWell(onTap: () {}),
          ),
          Column(
            children: [
              createTextInput(
                label: 'Nombre del docente',
                hint: 'John Doe',
              ),
              createTextInput(
                label: 'Correo institucional',
                hint: 'john.doe@gmail.com',
                keyboardType: TextInputType.emailAddress,
              ),
              createTextInput(label: 'Teléfono', hint: 'Opcional'),
            ].withVerticalSpace(16),
          ),
        ].withVerticalSpace(32),
      ),
    );
  }
}
