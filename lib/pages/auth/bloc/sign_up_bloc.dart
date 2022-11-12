import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:youniversity_app/pages/auth/model/email_field.dart';
import 'package:youniversity_app/pages/auth/model/full_name_field.dart';
import 'package:youniversity_app/pages/auth/model/password_confirmation_field.dart';
import 'package:youniversity_app/pages/auth/model/password_field.dart';
import 'package:youniversity_app/pages/auth/model/phone_field.dart';
import 'package:youniversity_app/pages/auth/repository/auth_repository.dart';
import 'package:youniversity_app/utils/formz_state.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(const SignUpState()) {
    on<SignUpFullNameChanged>(_onFullNameChanged);
    on<SignUpEmailChanged>(_onEmailChanged);
    on<SignUpPasswordChanged>(_onPasswordChanged);
    on<SignUpPasswordConfirmationChanged>(_onPasswordConfirmationChanged);
    on<SignUpPhoneChanged>(_onPhoneChanged);
    on<SignUpSubmitted>(_onSubmitted);
  }

  final AuthRepository _authRepository;

  void _onFullNameChanged(
    SignUpFullNameChanged event,
    Emitter<SignUpState> emit,
  ) {
    final fullName = FullNameField.dirty(event.fullName);
    emit(state.copyWith(
      fullName: fullName,
      status: Formz.validate([
        state.email,
        state.password,
        state.passwordConfirmation,
        state.phone,
        fullName,
      ]),
    ));
  }

  void _onEmailChanged(
    SignUpEmailChanged event,
    Emitter<SignUpState> emit,
  ) {
    final email = EmailField.dirty(event.email);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([
        state.fullName,
        state.password,
        state.passwordConfirmation,
        state.phone,
        email,
      ]),
    ));
  }

  void _onPasswordChanged(
    SignUpPasswordChanged event,
    Emitter<SignUpState> emit,
  ) {
    final password = PasswordField.dirty(event.password);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([
        state.fullName,
        state.email,
        state.passwordConfirmation,
        state.phone,
        password,
      ]),
    ));
  }

  void _onPasswordConfirmationChanged(
    SignUpPasswordConfirmationChanged event,
    Emitter<SignUpState> emit,
  ) {
    final passwordConfirmation = PasswordConfirmationField.dirty(
      password: state.password.value,
      value: event.passwordConfirmation,
    );
    emit(state.copyWith(
      passwordConfirmation: passwordConfirmation,
      status: Formz.validate([
        state.fullName,
        state.email,
        state.password,
        state.phone,
        passwordConfirmation,
      ]),
    ));
  }

  void _onPhoneChanged(
    SignUpPhoneChanged event,
    Emitter<SignUpState> emit,
  ) {
    final phone = PhoneField.dirty(event.phone);
    emit(state.copyWith(
      phone: phone,
      status: Formz.validate([
        state.fullName,
        state.email,
        state.password,
        state.passwordConfirmation,
        phone,
      ]),
    ));
  }

  Future<void> _onSubmitted(
    SignUpSubmitted event,
    Emitter<SignUpState> emit,
  ) async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        // TODO: Replace this with signup method
        await _authRepository.login(
          username: state.email.value,
          password: state.password.value,
        );
      } catch (_) {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    }
  }
}
