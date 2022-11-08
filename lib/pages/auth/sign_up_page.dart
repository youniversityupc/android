import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:youniversity_app/layout/app_theme.dart';
import 'package:youniversity_app/layout/route_constants.dart';
import 'package:youniversity_app/utils/text_style_extensions.dart';
import 'package:youniversity_app/utils/named_font_weight.dart';
import 'package:youniversity_app/utils/widget_list_extensions.dart';
import 'package:youniversity_app/utils/build_context_extensions.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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

  Widget createSubmitButton() {
    final textStyle = context.textTheme.labelLarge;
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => context.beamToNamed(RouteConstants.homeDashboard),
        child: Text(
          'CREAR CUENTA',
          style: textStyle?.withColor(Colors.white),
        ),
      ),
    );
  }

  Widget createSignInLabel() {
    final textStyle = context.textTheme.titleSmall;
    return GestureDetector(
      onTap: () => context.beamToNamed(RouteConstants.authSignUp),
      child: Center(
        child: Text.rich(
          TextSpan(
            children: <InlineSpan>[
              TextSpan(
                text: '¿Ya tienes una cuenta? ',
                style: textStyle?.withColor(AppColorPalette.darkerPrimaryColor),
              ),
              TextSpan(
                text: 'Inicia sesión',
                style: textStyle?.withColor(AppColorPalette.primaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 48),
      child: Column(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(image: AssetImage('assets/logo.png')),
              Column(
                children: [
                  Text(
                    'Crea tu cuenta en YOUniversity',
                    style: context.textTheme.headlineSmall
                        ?.withColor(AppColorPalette.primaryColor),
                  ),
                  Text(
                    'Organízate de la mejor manera',
                    style: context.textTheme.titleMedium
                        ?.withColor(AppColorPalette.darkerPrimaryColor)
                        .withWeight(NamedFontWeight.light),
                  )
                ],
              )
            ].withVerticalSpace(16),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                createTextInput(
                  label: 'Nombre completo',
                  hint: 'John Doe',
                ),
                createTextInput(
                  label: 'Correo electrónico',
                  hint: 'john.doe@gmail.com',
                  keyboardType: TextInputType.emailAddress,
                ),
                createTextInput(
                  label: 'Contraseña',
                  obscureText: true,
                ),
                createTextInput(
                  label: 'Confirmar contraseña',
                  obscureText: true,
                ),
                // createUniversityDropdown(),
                createTextInput(
                  label: 'Teléfono',
                  hint: '+51 999 999 999',
                  keyboardType: TextInputType.phone,
                ),
                createSubmitButton(),
                createSignInLabel(),
              ].withVerticalSpace(16),
            ),
          ),
        ],
      ),
    );
  }
}
