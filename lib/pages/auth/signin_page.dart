import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:youniversity_app/layout/app_theme.dart';
import 'package:youniversity_app/layout/route_constants.dart';
import 'package:youniversity_app/utils/text_style_extensions.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  Widget createEmailInput(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        labelText: 'Correo electrónico',
        hintText: 'john.doe@gmail.com',
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget createPasswordInput(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        labelText: 'Contraseña',
      ),
      keyboardType: TextInputType.text,
      obscureText: true,
    );
  }

  Widget createSubmitButton(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.labelLarge;
    return ElevatedButton(
      onPressed: () => beamToNamed(context, RouteConstants.homeDashboard),
      child: Text(
        "SIGN IN",
        style: textStyle?.withColor(Colors.white),
      ),
    );
  }

  Widget createSignUpLabel(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleSmall;
    return GestureDetector(
      onTap: () => beamToNamed(context, RouteConstants.authSignUp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '¿No tienes cuenta? ',
            style: textStyle?.withColor(AppColorPalette.darkerPrimaryColor),
          ),
          Text(
            'Regístrate aquí',
            style: textStyle?.withColor(AppColorPalette.primaryColor),
          ),
        ],
      ),
    );
  }

  Widget createForgotPasswordLabel(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleSmall;
    return GestureDetector(
      onTap: () => beamToNamed(context, RouteConstants.authSignUp),
      child: Center(
        child: Text(
          '¿Olvidaste tu contraseña?',
          style: textStyle?.withColor(AppColorPalette.primaryColor),
        ),
      ),
    );
  }

  void beamToNamed(BuildContext context, String route) {
    Beamer.of(context).beamToNamed(route);
  }

  List<Widget Function(BuildContext)> get itemBuilders => [
        createEmailInput,
        createPasswordInput,
        createSubmitButton,
        createSignUpLabel,
        createForgotPasswordLabel,
      ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 48),
      child: Column(
        children: <Widget>[
          const Center(
            child: Image(image: AssetImage('assets/logo.png')),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(16),
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: itemBuilders.length,
                itemBuilder: (context, index) => itemBuilders[index](context),
                separatorBuilder: (_, __) => const SizedBox(height: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
