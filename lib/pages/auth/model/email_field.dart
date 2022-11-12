import 'package:formz/formz.dart';

enum EmailValidationError {
  empty('Requerido'),
  invalid('Email inválido');

  const EmailValidationError(this.message);

  final String message;

  bool get isEmpty => this == EmailValidationError.empty;
  bool get isInvalid => this == EmailValidationError.invalid;
}

class EmailField extends FormzInput<String, EmailValidationError> {
  const EmailField.pure() : super.pure('');
  const EmailField.dirty([super.value = '']) : super.dirty();

  static final _emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9\-\_]+(\.[a-zA-Z]+)*$");

  @override
  EmailValidationError? validator(String? value) {
    if (value == null) return null;

    if (value.isEmpty == true) {
      return EmailValidationError.empty;
    }

    if (!_emailRegex.hasMatch(value)) {
      return EmailValidationError.invalid;
    }

    return null;
  }
}
