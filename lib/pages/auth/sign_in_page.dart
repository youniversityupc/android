import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:youniversity_app/layout/app_theme.dart';
import 'package:youniversity_app/layout/route_constants.dart';
import 'package:youniversity_app/pages/auth/bloc/login_bloc.dart';
import 'package:youniversity_app/pages/auth/repository/auth_repository.dart';
import 'package:youniversity_app/utils/text_style_extensions.dart';
import 'package:youniversity_app/utils/widget_list_extensions.dart';
import 'package:youniversity_app/utils/build_context_extensions.dart';

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
                    children: const [
                      _EmailInput(),
                      _PasswordInput(),
                      _LoginButton(),
                      _SignUpLabel(),
                      _ForgotPasswordLabel(),
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

class _EmailInput extends StatelessWidget {
  const _EmailInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          key: const ValueKey('SignInPage_EmailInput_TextField'),
          onChanged: (email) =>
              context.read<LoginBloc>().add(LoginEmailChanged(email)),
          decoration: InputDecoration(
            labelText: 'Correo electrónico',
            hintText: 'john.doe@gmail.com',
            errorText: state.email.invalid ? state.email.error?.message : null,
          ),
          keyboardType: TextInputType.emailAddress,
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          key: const ValueKey('SignInPage_PasswordInput_TextField'),
          onChanged: (password) =>
              context.read<LoginBloc>().add(LoginPasswordChanged(password)),
          decoration: InputDecoration(
            labelText: 'Contraseña',
            errorText:
                state.password.invalid ? state.password.error?.message : null,
          ),
          keyboardType: TextInputType.text,
          obscureText: true,
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        final textStyle = context.textTheme.labelLarge;
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : SizedBox(
                key: const ValueKey('SignInPage_Submit_Button'),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: state.status.isValidated
                      ? () =>
                          context.read<LoginBloc>().add(const LoginSubmitted())
                      : null,
                  child: Text(
                    'INICIAR SESIÓN',
                    style: textStyle?.withColor(Colors.white),
                  ),
                ),
              );
      },
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
