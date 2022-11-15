import 'package:formz/formz.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';

enum PhoneValidationError {
  invalid('Teléfono inválido');

  const PhoneValidationError(this.message);

  final String message;

  bool get isInvalid => this == PhoneValidationError.invalid;
}

class PhoneField extends FormzInput<String, PhoneValidationError> {
  const PhoneField.pure() : super.pure('');
  const PhoneField.dirty([super.value = '']) : super.dirty();

  @override
  PhoneValidationError? validator(String? value) {
    if (value == null) return null;

    final phone = PhoneNumber.parse(
      value,
      callerCountry: IsoCode.PE,
      destinationCountry: IsoCode.PE,
    );

    if (!phone.isValidLength()) return PhoneValidationError.invalid;
    if (!phone.isValid()) return PhoneValidationError.invalid;

    return null;
  }
}
