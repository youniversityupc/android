import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:youniversity_app/pages/profile/models/student_model.dart';

class UserPreferences {
  static SharedPreferences? _preferences;

  static const _keyUser = 'user';
  static const myUser = StudentModel(
    photoPath:
        'https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    studentFullName: 'Nicola Casanova',
    email: 'u201812345@upc.edu.pe',
    tel: '+51 999 999 999',
    college: 'Universidad Peruana de Ciencias Aplicadas',
  );

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(StudentModel user) async {
    final json = jsonEncode(user.toJson());

    await _preferences?.setString(_keyUser, json);
  }

  static StudentModel getUser() {
    final json = _preferences?.getString(_keyUser);

    return json == null ? myUser : StudentModel.fromJson(jsonDecode(json));
  }
}
