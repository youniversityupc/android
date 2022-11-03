import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class ActivityForm extends StatefulWidget {
  const ActivityForm({super.key});

  // final void Function(ActivityModel) onAddActivity;

  @override
  State<StatefulWidget> createState() => ActivityFormState();
}

class ActivityFormState extends State<ActivityForm> {
  final _formKey = GlobalKey<FormState>();

  // final Map<String, String> _currentOptionsSelected = {
  //   'type': 'Grupal',
  //   'course': 'Not selected yet'
  // };

  // final List<String> _coursesList = [
  //   'Base de Datos',
  //   'IHC y Tecnologías Móviles'
  // ];

  // final List<String> _typeList = ['Grupal', 'Individual'];

  void _onFormChange() {
    setState(() {
      Form.of(primaryFocus!.context!)!.save();
    });
  }

  String? _inputValidation(String? value) {
    if (value == null || value.isEmpty) return 'Requerido';
    return null;
  }

  bool _isFormValid() {
    return _formKey.currentState!.validate();
  }

  void _showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.always,
      onChanged: _onFormChange,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(labelText: 'Event Name'),
              validator: _inputValidation,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (!_isFormValid()) return;
              _showSnackBar(context, 'Processing data');
              // widget.onAddActivity(activity);
              Beamer.of(context).popRoute();
            },
            child: const Text('Submit'),
          )
        ],
      ),
    );
  }
}
