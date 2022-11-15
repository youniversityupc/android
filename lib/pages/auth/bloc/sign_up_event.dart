part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignUpFullNameChanged extends SignUpEvent {
  const SignUpFullNameChanged(this.fullName);

  final String fullName;

  @override
  List<Object> get props => [fullName];
}

class SignUpEmailChanged extends SignUpEvent {
  const SignUpEmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class SignUpPasswordChanged extends SignUpEvent {
  const SignUpPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class SignUpPasswordConfirmationChanged extends SignUpEvent {
  const SignUpPasswordConfirmationChanged(this.passwordConfirmation);

  final String passwordConfirmation;

  @override
  List<Object> get props => [passwordConfirmation];
}

class SignUpPhoneChanged extends SignUpEvent {
  const SignUpPhoneChanged(this.phone);

  final String phone;

  @override
  List<Object> get props => [phone];
}

class SignUpSubmitted extends SignUpEvent {
  const SignUpSubmitted();
}
