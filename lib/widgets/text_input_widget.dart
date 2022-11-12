import 'package:flutter/material.dart';

class TextInputWidget extends StatefulWidget {
  
  final String label;
  final String text;
  final String? hint;
  final TextInputType keyboardType;
  final bool obscureText;
  final ValueChanged<String> onChanged;

  const TextInputWidget({
    Key? key,
    required this.label,
    this.hint,
    required this.text,
    required this.onChanged,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
  }) : super(key: key);

  @override
  _TextInputWidgetState createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController(text: widget.text);
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hint,
      ),
      keyboardType: widget.keyboardType,
      onChanged: widget.onChanged,
    );
  }
}
