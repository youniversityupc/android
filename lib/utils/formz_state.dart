import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

abstract class FormzState extends Equatable {
  const FormzState({required this.status});

  final FormzStatus status;

  List<Object?> get fields;

  @override
  List<Object?> get props => [status, ...fields];
}
