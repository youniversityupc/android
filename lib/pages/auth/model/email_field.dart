import 'package:formz/formz.dart';

enum EmailValidationError { empty }

class EmailField extends FormzInput<String, EmailValidationError> {
  const EmailField.pure() : super.pure('');
  const EmailField.dirty([super.value = '']) : super.dirty();

  @override
  EmailValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : EmailValidationError.empty;
  }
}
