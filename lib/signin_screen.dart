import 'package:flutter/material.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.all(16), children: [
      signInEmail(),
      const SizedBox(height: 16),
      singInPasswrod()
    ]);
  }

  Widget signInEmail() => const TextField(
        decoration: InputDecoration(
          hintText: 'Your email',
          labelText: 'Email',
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.emailAddress,
      );
  Widget singInPasswrod() => const TextField(
        decoration: InputDecoration(
          hintText: 'Your password',
          labelText: 'Password',
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.visiblePassword,
      );
}
