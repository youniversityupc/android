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
      singInPasswrod(),
      const SizedBox(height: 16),
      MaterialButton(
        disabledColor: const Color.fromARGB(255, 15, 95, 160),
        onPressed: signIn(),
        child: const Text(
          "SIGN IN",
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
      const Center(
        child: Text.rich(TextSpan(children: <TextSpan>[
          TextSpan(
            text: "Doesn't have an account? ",
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "Sign up",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color.fromARGB(255, 15, 95, 160),
            ),
          )
        ])),
      ),
      const SizedBox(
        height: 12,
      ),
      const Center(
        child: Text(
          "Forgot your password?",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Color.fromARGB(255, 15, 95, 160),
          ),
        ),
      )
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

  signIn() {
    // To do
  }
}
