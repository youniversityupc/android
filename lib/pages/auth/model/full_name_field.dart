import 'package:formz/formz.dart';

enum FullNameValidationError {
  empty('Requerido');

  const FullNameValidationError(this.message);

  final String message;

  bool get isEmpty => this == FullNameValidationError.empty;
}

class FullNameField extends FormzInput<String, FullNameValidationError> {
  const FullNameField.pure() : super.pure('');
  const FullNameField.dirty([super.value = '']) : super.dirty();

  @override
  FullNameValidationError? validator(String? value) {
    if (value == null) return null;

    if (value.isEmpty) {
      return FullNameValidationError.empty;
    }

    return null;
  }
}
