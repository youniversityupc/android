import 'package:flutter/material.dart';

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[
        SizedBox(
          height: 48,
        ),
        Center(
          child: Image(image: AssetImage("assets/logo.png")),
        ),
        SizedBox(
          height: 16,
        ),
        Center(
          child: Text.rich(
            TextSpan(children: <TextSpan>[
              TextSpan(
                text: "Create a YOUniversity Account\n",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Color.fromARGB(255, 15, 95, 160),
                ),
              ),
              TextSpan(
                text: "Organize the best way",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Color.fromRGBO(67, 77, 89, 1)),
              )
            ]),
          ),
        )
      ],
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  String password = '';
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        buildName(),
        const SizedBox(height: 16),
        buildEmail(),
        const SizedBox(height: 16),
        buildPassword(),
        const SizedBox(height: 16),
        buildUniversity(),
        const SizedBox(height: 16),
        buildPhone(),
        const SizedBox(height: 16),
        MaterialButton(
          disabledColor: const Color.fromRGBO(50, 106, 140, 1),
          onPressed: sendData(),
          child: const Text(
            "CREATE ACCOUNT",
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
        const Center(
          child: Text.rich(TextSpan(children: <TextSpan>[
            TextSpan(
              text: "Already signed up? ",
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16,
                color: Color.fromRGBO(67, 77, 89, 1),
              ),
            ),
            TextSpan(
              text: "Sign in",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color.fromRGBO(50, 106, 140, 1),
              ),
            )
          ])),
        )
      ],
    );
  }

  Widget buildName() => const TextField(
        decoration: InputDecoration(
          hintText: 'John Doe',
          labelText: 'Name',
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.name,
      );

  Widget buildEmail() => const TextField(
        decoration: InputDecoration(
          hintText: 'johndoe@gmail.com',
          labelText: 'Email',
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.emailAddress,
      );
  Widget buildPassword() => TextField(
        onChanged: (value) => setState(() => password = value),
        decoration: InputDecoration(
          hintText: 'Please, enter a strong password',
          labelText: 'Password',
          suffixIcon: IconButton(
            icon: isPasswordVisible
                ? const Icon(Icons.visibility_off)
                : const Icon(Icons.visibility),
            onPressed: () =>
                setState(() => isPasswordVisible = !isPasswordVisible),
          ),
          border: const OutlineInputBorder(),
        ),
        obscureText: isPasswordVisible,
      );
  Widget buildUniversity() => const TextField(
        decoration: InputDecoration(
          hintText: 'Universidad Peruana de Ciencias Aplicadas',
          labelText: 'University',
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.name,
      );
  Widget buildPhone() => const TextField(
        decoration: InputDecoration(
          hintText: '999 999 999',
          labelText: 'Phone number',
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.phone,
      );

  sendData() {
    // To do
  }
}
