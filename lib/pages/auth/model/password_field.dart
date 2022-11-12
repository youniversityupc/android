import 'package:formz/formz.dart';

enum PasswordValidationError {
  empty('Requerido'),
  minLength('La contraseña debe tener mínimo 8 caracteres');

  const PasswordValidationError(this.message);

  final String message;

  bool get isEmpty => this == PasswordValidationError.empty;
  bool get isMinLength => this == PasswordValidationError.minLength;
}

class PasswordField extends FormzInput<String, PasswordValidationError> {
  const PasswordField.pure() : super.pure('');
  const PasswordField.dirty([super.value = '']) : super.dirty();

  @override
  PasswordValidationError? validator(String? value) {
    if (value == null) return null;

    if (value.isEmpty == true) {
      return PasswordValidationError.empty;
    }

    if (value.length < 8) {
      return PasswordValidationError.minLength;
    }

    return null;
  }
}
