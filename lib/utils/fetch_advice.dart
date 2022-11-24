import 'dart:convert';
import 'package:http/http.dart' as http;

const url = 'https://api.adviceslip.com/advice';

class Slip {
  final int id;
  final String advice;

  const Slip({
    required this.id,
    required this.advice,
  });

  factory Slip.fromJson(Map<String, dynamic> json) {
    return Slip(
      id: json['id'],
      advice: json['advice'],
    );
  }
}

Future<Slip> fetchAdvice() async {
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return Slip.fromJson(json.decode(response.body)['slip']);
  } else {
    throw Exception('Failed to fetch piece of advice');
  }
}
