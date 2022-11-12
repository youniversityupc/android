part of 'login_bloc.dart';

class LoginState extends FormzState {
  const LoginState({
    super.status = FormzStatus.pure,
    this.email = const EmailField.pure(),
    this.password = const PasswordField.pure(),
  });

  final EmailField email;
  final PasswordField password;

  LoginState copyWith({
    FormzStatus? status,
    EmailField? email,
    PasswordField? password,
  }) {
    return LoginState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get fields => [email, password];
}
