import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

enum AuthStatus {
  unknown,
  error,
  authenticated,
  unauthenticated,
}

class AuthRepository {
  AuthRepository({
    http.Client? client,
  }) : _client = client ?? http.Client();

  static const _domain = 'api.youniversityapp.ga';
  static const _base = '/api/auth';

  final _controller = StreamController<AuthStatus>();
  final http.Client _client;

  Uri _createUri(String path) {
    return Uri.https(_domain, '$_base$path');
  }

  void _handleJwt(Map<dynamic, dynamic> body) {
    if (!body.containsKey('jwt')) {
      return _controller.add(AuthStatus.error);
    }

    final jwt = body['jwt'];
    if (jwt is! String) {
      return _controller.add(AuthStatus.error);
    }

    _controller.add(AuthStatus.authenticated);
  }

  Stream<AuthStatus> get status async* {
    yield AuthStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<void> login({
    required String username,
    required String password,
  }) async {
    _controller.add(AuthStatus.unknown);
    try {
      final url = _createUri('/local');
      final response = await _client.post(url, body: {
        'identifier': username,
        'password': password,
      });
      final body = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      _handleJwt(body);
    } catch (_) {
      _controller.add(AuthStatus.error);
    }
  }

  Future<void> register({
    required String email,
    required String username,
    required String password,
  }) async {
    _controller.add(AuthStatus.unknown);
    try {
      final url = _createUri('/local/register');
      final response = await _client.post(url, body: {
        'email': username,
        'username': username.split('@')[0],
        'password': password,
      });
      final body = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      _handleJwt(body);
    } catch (_) {
      _controller.add(AuthStatus.error);
    }
  }

  void logout() {
    _controller.add(AuthStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
