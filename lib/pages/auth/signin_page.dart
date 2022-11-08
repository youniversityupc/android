import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:youniversity_app/layout/app_theme.dart';
import 'package:youniversity_app/layout/route_constants.dart';
import 'package:youniversity_app/utils/text_style_extensions.dart';
import 'package:youniversity_app/utils/widget_list_extensions.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  Widget createEmailInput() {
    return const TextField(
      decoration: InputDecoration(
        labelText: 'Correo electrónico',
        hintText: 'john.doe@gmail.com',
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget createPasswordInput() {
    return const TextField(
      decoration: InputDecoration(
        labelText: 'Contraseña',
      ),
      keyboardType: TextInputType.text,
      obscureText: true,
    );
  }

  Widget createSubmitButton() {
    final textStyle = Theme.of(context).textTheme.labelLarge;
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => beamToNamed(RouteConstants.homeDashboard),
        child: Text(
          'SIGN IN',
          style: textStyle?.withColor(Colors.white),
        ),
      ),
    );
  }

  Widget createSignUpLabel() {
    final textStyle = Theme.of(context).textTheme.titleSmall;
    return GestureDetector(
      onTap: () => beamToNamed(RouteConstants.authSignUp),
      child: Center(
        child: Text.rich(
          TextSpan(
            children: <InlineSpan>[
              TextSpan(
                text: '¿No tienes cuenta? ',
                style: textStyle?.withColor(AppColorPalette.darkerPrimaryColor),
              ),
              TextSpan(
                text: 'Regístrate aquí',
                style: textStyle?.withColor(AppColorPalette.primaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget createForgotPasswordLabel() {
    final textStyle = Theme.of(context).textTheme.titleSmall;
    return GestureDetector(
      onTap: () => beamToNamed(RouteConstants.authSignUp),
      child: Center(
        child: Text(
          '¿Olvidaste tu contraseña?',
          style: textStyle?.withColor(AppColorPalette.primaryColor),
        ),
      ),
    );
  }

  void beamToNamed(String route) {
    Beamer.of(context).beamToNamed(route);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 48),
      child: Column(
        children: <Widget>[
          const Center(
            child: Image(image: AssetImage('assets/logo.png')),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            child: Column(
              children: [
                createEmailInput(),
                createPasswordInput(),
                createSubmitButton(),
                createSignUpLabel(),
                createForgotPasswordLabel(),
              ].withVerticalSpace(16),
            ),
          ),
        ],
      ),
    );
  }
}
