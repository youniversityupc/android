import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:youniversity_app/utils/build_context_extensions.dart';
import 'package:youniversity_app/utils/formz_state.dart';
import 'package:youniversity_app/utils/text_style_extensions.dart';

class AuthButton<B extends Bloc<E, S>, S extends FormzState, E>
    extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.buildEvent,
    required this.child,
  });

  final E Function() buildEvent;
  final Widget child;

  void _handleClick(BuildContext context, S state) {
    if (!state.status.isValidated) return;
    final bloc = context.read<B>();
    final event = buildEvent();
    bloc.add(event);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<B, S>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        final textStyle = context.textTheme.labelLarge?.withColor(Colors.white);
        if (state.status.isSubmissionInProgress) {
          return const CircularProgressIndicator();
        }

        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => _handleClick(context, state),
            child: DefaultTextStyle.merge(
              style: textStyle,
              child: child,
            ),
          ),
        );
      },
    );
  }
}
