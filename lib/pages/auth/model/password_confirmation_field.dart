import 'package:formz/formz.dart';

enum PasswordConfirmationValidationError {
  empty('Requerido'),
  mismatch('Las contraseñas deben coincidir');

  const PasswordConfirmationValidationError(this.message);

  final String message;

  bool get isEmpty => this == PasswordConfirmationValidationError.empty;
  bool get isMismatch => this == PasswordConfirmationValidationError.mismatch;
}

class PasswordConfirmationField
    extends FormzInput<String, PasswordConfirmationValidationError> {
  const PasswordConfirmationField.pure({this.password = ''}) : super.pure('');
  const PasswordConfirmationField.dirty({
    required this.password,
    String value = '',
  }) : super.dirty(value);

  final String password;

  @override
  PasswordConfirmationValidationError? validator(String? value) {
    if (value == null) return null;

    if (value.isEmpty) {
      return PasswordConfirmationValidationError.empty;
    }

    if (password != value) {
      return PasswordConfirmationValidationError.mismatch;
    }

    return null;
  }
}
