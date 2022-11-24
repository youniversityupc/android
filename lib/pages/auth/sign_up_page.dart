import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youniversity_app/components/bloc_text_field.dart';
import 'package:youniversity_app/layout/app_theme.dart';
import 'package:youniversity_app/layout/route_constants.dart';
import 'package:youniversity_app/pages/auth/bloc/sign_up_bloc.dart';
import 'package:youniversity_app/pages/auth/components/auth_button.dart';
import 'package:youniversity_app/pages/auth/repository/auth_repository.dart';
import 'package:youniversity_app/utils/text_style_extensions.dart';
import 'package:youniversity_app/utils/named_font_weight.dart';
import 'package:youniversity_app/utils/widget_list_extensions.dart';
import 'package:youniversity_app/utils/build_context_extensions.dart';

typedef _SignUpTextField = BlocTextField<SignUpBloc, SignUpState, SignUpEvent>;

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(
        authRepository: context.read<AuthRepository>(),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Container(
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
                    children: [
                      _SignUpTextField(
                        buildWhen: (previous, current) =>
                            previous.fullName != current.fullName,
                        buildEvent: (value) => SignUpFullNameChanged(value),
                        buildErrorText: (state) => state.fullName.invalid
                            ? state.fullName.error?.message
                            : null,
                        labelText: 'Nombre completo',
                        hintText: 'John Doe',
                      ),
                      _SignUpTextField(
                        buildWhen: (previous, current) =>
                            previous.email != current.email,
                        buildEvent: (value) => SignUpEmailChanged(value),
                        buildErrorText: (state) => state.email.invalid
                            ? state.email.error?.message
                            : null,
                        labelText: 'Correo electrónico',
                        hintText: 'john.doe@gmail.com',
                        keyboardType: TextInputType.emailAddress,
                      ),
                      _SignUpTextField(
                        buildWhen: (previous, current) =>
                            previous.password != current.password,
                        buildEvent: (value) => SignUpPasswordChanged(value),
                        buildErrorText: (state) => state.password.invalid
                            ? state.password.error?.message
                            : null,
                        labelText: 'Contraseña',
                        obscureText: true,
                      ),
                      _SignUpTextField(
                        buildWhen: (previous, current) =>
                            previous.passwordConfirmation !=
                            current.passwordConfirmation,
                        buildEvent: (value) =>
                            SignUpPasswordConfirmationChanged(value),
                        buildErrorText: (state) =>
                            state.passwordConfirmation.invalid
                                ? state.passwordConfirmation.error?.message
                                : null,
                        labelText: 'Confirmar contraseña',
                        obscureText: true,
                      ),
                      _SignUpTextField(
                        buildWhen: (previous, current) =>
                            previous.phone != current.phone,
                        buildEvent: (value) => SignUpPhoneChanged(value),
                        buildErrorText: (state) => state.phone.invalid
                            ? state.phone.error?.message
                            : null,
                        labelText: 'Teléfono',
                        hintText: '+51 999 999 999',
                        keyboardType: TextInputType.phone,
                      ),
                      AuthButton<SignUpBloc, SignUpState, SignUpEvent>(
                        buildEvent: () => const SignUpSubmitted(),
                        child: const Text('CREAR CUENTA'),
                      ),
                      const _SignUpTermsAndConditions(),
                      const SizedBox(height: 8),
                      const _SignInLabel(),
                    ].withVerticalSpace(16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SignInLabel extends StatelessWidget {
  const _SignInLabel();

  @override
  Widget build(BuildContext context) {
    final textStyle = context.textTheme.titleSmall;
    return GestureDetector(
      onTap: () => context.popToNamed(RouteConstants.authSignIn),
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
}

class _SignUpTermsAndConditions extends StatelessWidget {
  const _SignUpTermsAndConditions();

  @override
  Widget build(BuildContext context) {
    final textStyle = context.textTheme.titleSmall;
    return Center(
      child: Text(
        'Al presionar este botón, estas aceptando nuestros términos y condiciones',
        style: textStyle?.withColor(AppColorPalette.primaryColor),
      ),
    );
  }
}
