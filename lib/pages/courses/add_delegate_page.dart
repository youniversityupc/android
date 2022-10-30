import 'package:flutter/material.dart';
import 'package:youniversity_app/utils/app_colors.dart';

class AddDelegate extends StatefulWidget {
  const AddDelegate({super.key});

  @override
  State<AddDelegate> createState() => _AddDelegateState();
}

class _AddDelegateState extends State<AddDelegate> {
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
          child: delegateName(),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: delegateEmail(),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: delegatePhone(),
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

  Widget delegateName() => const TextField(
        decoration: InputDecoration(
            hintText: 'Diego Albitres',
            labelText: 'Nombre del delegado',
            border: OutlineInputBorder()),
        keyboardType: TextInputType.name,
      );

  Widget delegateEmail() => const TextField(
        decoration: InputDecoration(
            hintText: 'delegate_user@upc.edu.pe',
            labelText: 'Correo institucional',
            border: OutlineInputBorder()),
        keyboardType: TextInputType.emailAddress,
      );
  Widget delegatePhone() => const TextField(
        decoration: InputDecoration(
            hintText: '999 999 999',
            labelText: 'Teléfono',
            border: OutlineInputBorder()),
        keyboardType: TextInputType.phone,
      );
}
