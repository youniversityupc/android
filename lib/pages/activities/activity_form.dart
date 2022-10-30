import 'package:flutter/material.dart';
import 'package:youniversity_app/models/activity-data-class.model.dart';

class ActivityForm extends StatefulWidget {
  final Function(ActivityDataClass) onAddActivity;
  const ActivityForm({super.key, required this.onAddActivity});

  @override
  State<StatefulWidget> createState() => ActivityFormState();
}

class ActivityFormState extends State<ActivityForm> {
  final String? Function(String? value)? _inputValidation = (value) {
    if (value == null || value.isEmpty) return 'Please enter some text';
    return "";
  };
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> _currentOptionsSelected = {
    'type': 'Grupal',
    'course': 'Not selected yet'
  };
  final List<String> _coursesList = [
    'Base de Datos',
    'IHC y Tecnologías Móviles'
  ];
  final List<String> _typeList = ['Grupal', 'Individual'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("New Activity"),
        ),
        body: _createNewForm());
  }

  Widget _createNewForm() {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(labelText: "Event Name"),
              validator: _inputValidation,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate() == false) return;
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Processing data")));
                Navigator.pop(context);
                //(context.widget as ActivityForm).onAddActivity();
              },
              child: const Text("Submit"))
        ],
      ),
      onChanged: () {
        setState(() {
          Form.of(primaryFocus!.context!)!.save();
        });
      },
    );
  }
}
