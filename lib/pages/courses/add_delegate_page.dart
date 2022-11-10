import 'package:flutter/material.dart';
import 'package:youniversity_app/components/profile_avatar.dart';
import 'package:youniversity_app/utils/widget_list_extensions.dart';

class AddDelegate extends StatefulWidget {
  const AddDelegate({super.key});

  @override
  State<AddDelegate> createState() => _AddDelegateState();
}

class _AddDelegateState extends State<AddDelegate> {
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
            backgroundImage: const AssetImage('assets/dalb.jpg'),
            child: InkWell(onTap: () {}),
          ),
          Column(
            children: [
              createTextInput(
                label: 'Nombre del delegado',
                hint: 'John Doe',
              ),
              createTextInput(
                label: 'Correo institucional',
                hint: 'john.doe@gmail.com',
                keyboardType: TextInputType.emailAddress,
              ),
              createTextInput(label: 'Teléfono', hint: 'Opcional'),
            ].withVerticalSpace(16),
          )
        ].withVerticalSpace(32),
      ),
    );
  }
}
