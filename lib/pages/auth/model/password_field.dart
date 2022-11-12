import 'package:formz/formz.dart';

enum PasswordValidationError { empty }

class PasswordField extends FormzInput<String, PasswordValidationError> {
  const PasswordField.pure() : super.pure('');
  const PasswordField.dirty([super.value = '']) : super.dirty();

  @override
  PasswordValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : PasswordValidationError.empty;
  }
}
