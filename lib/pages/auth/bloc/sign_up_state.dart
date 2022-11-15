part of 'sign_up_bloc.dart';

class SignUpState extends FormzState {
  const SignUpState({
    super.status = FormzStatus.pure,
    this.fullName = const FullNameField.pure(),
    this.email = const EmailField.pure(),
    this.password = const PasswordField.pure(),
    this.passwordConfirmation = const PasswordConfirmationField.pure(),
    this.phone = const PhoneField.pure(),
  });

  final FullNameField fullName;
  final EmailField email;
  final PasswordField password;
  final PasswordConfirmationField passwordConfirmation;
  final PhoneField phone;

  SignUpState copyWith({
    FormzStatus? status,
    FullNameField? fullName,
    EmailField? email,
    PasswordField? password,
    PasswordConfirmationField? passwordConfirmation,
    PhoneField? phone,
  }) {
    return SignUpState(
      status: status ?? this.status,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      password: password ?? this.password,
      passwordConfirmation: passwordConfirmation ?? this.passwordConfirmation,
      phone: phone ?? this.phone,
    );
  }

  @override
  List<Object> get fields =>
      [fullName, email, password, passwordConfirmation, phone];
}
