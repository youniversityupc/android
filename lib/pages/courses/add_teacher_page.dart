import 'package:flutter/material.dart';
import 'package:youniversity_app/utils/app_colors.dart';

class AddTeacher extends StatefulWidget {
  const AddTeacher({super.key});

  @override
  State<AddTeacher> createState() => _AddTeacherState();
}

class _AddTeacherState extends State<AddTeacher> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        RawMaterialButton(
          onPressed: () {},
          elevation: 1.0,
          fillColor: const Color.fromARGB(255, 158, 203, 231),
          padding: const EdgeInsets.all(32.0),
          shape: const CircleBorder(),
          child: const Icon(
            Icons.add_a_photo,
            size: 64.0,
            color: Colors.white,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: teacherName(),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: teacherEmail(),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: teacherPhone(),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: MaterialButton(
            onPressed: () {},
            color: AppColors.darkBlueColor,
            child: const Text(
              'GUARDAR',
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            ),
          ),
        ),
      ],
    );
  }

  Widget teacherName() => const TextField(
        decoration: InputDecoration(
            hintText: 'David Quevedo',
            labelText: 'Nombre del docente',
            border: OutlineInputBorder()),
        keyboardType: TextInputType.name,
      );

  Widget teacherEmail() => const TextField(
        decoration: InputDecoration(
            hintText: 'user@upc.edu.pe',
            labelText: 'Correo institucional',
            border: OutlineInputBorder()),
        keyboardType: TextInputType.emailAddress,
      );
  Widget teacherPhone() => const TextField(
        decoration: InputDecoration(
            hintText: '999 999 999',
            labelText: 'Teléfono (opcional)',
            border: OutlineInputBorder()),
        keyboardType: TextInputType.phone,
      );
}
