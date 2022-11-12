import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocTextField<B extends Bloc<E, S>, S, E> extends StatelessWidget {
  const BlocTextField({
    super.key,
    this.textFieldKey,
    this.labelText,
    this.hintText,
    this.keyboardType,
    this.obscureText = false,
    required this.buildWhen,
    required this.buildEvent,
    this.buildErrorText = _defaultErrorTextBuilder,
  });

  final Key? textFieldKey;
  final String? labelText;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final BlocBuilderCondition<S> buildWhen;
  final E Function(String value) buildEvent;
  final String? Function(S state) buildErrorText;

  static String? _defaultErrorTextBuilder(_) => null;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<B, S>(
      buildWhen: buildWhen,
      builder: (context, state) {
        return TextField(
          key: textFieldKey,
          onChanged: (value) {
            final bloc = context.read<B>();
            final event = buildEvent(value);
            bloc.add(event);
          },
          decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            errorText: buildErrorText(state),
          ),
          keyboardType: keyboardType,
          obscureText: obscureText,
        );
      },
    );
  }
}
