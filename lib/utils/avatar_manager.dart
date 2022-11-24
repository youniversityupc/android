import 'dart:convert';
import 'dart:html';
import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';

String generateMd5(String input) {
  return md5.convert(utf8.encode(input)).toString();
}

NetworkImage generateAvatar(String email) {
  final url =
      'https://www.gravatar.com/avatar/${generateMd5(email.trim().toLowerCase())}';

  return NetworkImage(url);
}
