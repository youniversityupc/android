import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youniversity_app/components/bloc_text_field.dart';
import 'package:youniversity_app/layout/app_theme.dart';
import 'package:youniversity_app/layout/route_constants.dart';
import 'package:youniversity_app/pages/auth/bloc/login_bloc.dart';
import 'package:youniversity_app/pages/auth/components/auth_button.dart';
import 'package:youniversity_app/pages/auth/repository/auth_repository.dart';
import 'package:youniversity_app/utils/text_style_extensions.dart';
import 'package:youniversity_app/utils/widget_list_extensions.dart';
import 'package:youniversity_app/utils/build_context_extensions.dart';

typedef _SignInTextField = BlocTextField<LoginBloc, LoginState, LoginEvent>;

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(
        authRepository: context.read<AuthRepository>(),
      ),
      child: SafeArea(
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
                      _SignInTextField(
                        textFieldKey:
                            const ValueKey('SignInPage_Email_TextField'),
                        buildWhen: (previous, current) =>
                            previous.email != current.email,
                        buildEvent: (value) => LoginEmailChanged(value),
                        buildErrorText: (state) => state.email.invalid
                            ? state.email.error?.message
                            : null,
                        labelText: 'Correo electrónico',
                        hintText: 'john.doe@gmail.com',
                        keyboardType: TextInputType.emailAddress,
                      ),
                      _SignInTextField(
                        textFieldKey:
                            const ValueKey('SignInPage_Password_TextField'),
                        buildWhen: (previous, current) =>
                            previous.password != current.password,
                        buildEvent: (value) => LoginPasswordChanged(value),
                        buildErrorText: (state) => state.password.invalid
                            ? state.password.error?.message
                            : null,
                        labelText: 'Contraseña',
                        obscureText: true,
                      ),
                      AuthButton<LoginBloc, LoginState, LoginEvent>(
                        buildEvent: () => const LoginSubmitted(),
                        child: const Text('INICIAR SESIÓN'),
                      ),
                      const _SignUpLabel(),
                      const _ForgotPasswordLabel(),
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

class _SignUpLabel extends StatelessWidget {
  const _SignUpLabel();

  @override
  Widget build(BuildContext context) {
    final textStyle = context.textTheme.titleSmall;
    return GestureDetector(
      onTap: () => context.popToNamed(RouteConstants.authSignUp),
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
}

class _ForgotPasswordLabel extends StatelessWidget {
  const _ForgotPasswordLabel();

  @override
  Widget build(BuildContext context) {
    final textStyle = context.textTheme.titleSmall;
    return GestureDetector(
      onTap: () => context.popToNamed(RouteConstants.authSignUp),
      child: Center(
        child: Text(
          '¿Olvidaste tu contraseña?',
          style: textStyle?.withColor(AppColorPalette.primaryColor),
        ),
      ),
    );
  }
}
