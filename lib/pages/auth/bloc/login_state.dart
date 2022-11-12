part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.status = FormzStatus.pure,
    this.email = const EmailField.pure(),
    this.password = const PasswordField.pure(),
  });

  final FormzStatus status;
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
  List<Object> get props => [status, email, password];
}
