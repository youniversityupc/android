import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:youniversity_app/layout/app_theme.dart';
import 'package:youniversity_app/layout/route_constants.dart';
import 'package:youniversity_app/utils/text_style_extensions.dart';
import 'package:youniversity_app/utils/widget_list_extensions.dart';
import 'package:youniversity_app/utils/build_context_extensions.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
    final textStyle = context.textTheme.labelLarge;
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () =>
            context.beamToReplacementNamed(RouteConstants.homeDashboard),
        child: Text(
          'INICIAR SESIÓN',
          style: textStyle?.withColor(Colors.white),
        ),
      ),
    );
  }

  Widget createSignUpLabel() {
    final textStyle = context.textTheme.titleSmall;
    return GestureDetector(
      onTap: () => context.beamToReplacementNamed(RouteConstants.authSignUp),
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
    final textStyle = context.textTheme.titleSmall;
    return GestureDetector(
      onTap: () => context.beamToNamed(RouteConstants.authSignUp),
      child: Center(
        child: Text(
          '¿Olvidaste tu contraseña?',
          style: textStyle?.withColor(AppColorPalette.primaryColor),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
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
        ),
      ),
    );
  }
}
