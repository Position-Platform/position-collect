// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apiService.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$ApiService extends ApiService {
  _$ApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ApiService;

  @override
  Future<Response<dynamic>> login(String apiKey, Map<String, dynamic> body) {
    final $url = 'https://services.position.cm/api/auth/login';
    final $headers = {
      'X-Authorization': apiKey,
      'Accept': 'application/json',
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getuser(String token, String apiKey) {
    final $url = 'https://services.position.cm/api/user/me';
    final $headers = {
      'Authorization': token,
      'X-Authorization': apiKey,
      'Accept': 'application/json',
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> forgetPassword(Map<String, dynamic> body) {
    final $url = 'https://services.position.cm/api/auth/password/forgot';
    final $headers = {
      'Accept': 'application/json',
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> logout(String token, String apiKey) {
    final $url = 'https://services.position.cm/api/auth/logout';
    final $headers = {
      'Authorization': token,
      'X-Authorization': apiKey,
      'Accept': 'application/json',
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> addtracking(
      String token, String apiKey, Map<String, dynamic> body) {
    final $url = 'https://services.position.cm/api/tracking';
    final $headers = {
      'Authorization': token,
      'X-Authorization': apiKey,
      'Accept': 'application/json',
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getbatiments(String apiKey) {
    final $url = 'https://services.position.cm/api/batiments';
    final $headers = {
      'X-Authorization': apiKey,
      'Accept': 'application/json',
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getbatimentsnumber(String apiKey) {
    final $url = 'https://services.position.cm/api/batimentsnumber';
    final $headers = {
      'X-Authorization': apiKey,
      'Accept': 'application/json',
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> addbatiment(
      String token, String apiKey, Map<String, dynamic> body) {
    final $url = 'https://services.position.cm/api/batiments';
    final $headers = {
      'Authorization': token,
      'X-Authorization': apiKey,
      'Accept': 'application/json',
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> searchetablissement(String apiKey, String query) {
    final $url = 'https://services.position.cm/api/search/etablissements';
    final $params = <String, dynamic>{'q': query};
    final $headers = {
      'X-Authorization': apiKey,
      'Accept': 'application/json',
    };

    final $request = Request('GET', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> addetablissement(
      String token, String apiKey, Map<String, dynamic> body) {
    final $url = 'https://services.position.cm/api/etablissements';
    final $headers = {
      'Authorization': token,
      'X-Authorization': apiKey,
      'Accept': 'application/json',
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> addhoraire(
      String token, String apiKey, Map<String, dynamic> body) {
    final $url = 'https://services.position.cm/api/horaires';
    final $headers = {
      'Authorization': token,
      'X-Authorization': apiKey,
      'Accept': 'application/json',
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> addimage(
      String token, String apiKey, Map<String, dynamic> body) {
    final $url = 'https://services.position.cm/api/images';
    final $headers = {
      'Authorization': token,
      'X-Authorization': apiKey,
      'Accept': 'application/json',
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> addtelephone(
      String token, String apiKey, Map<String, dynamic> body) {
    final $url = 'https://services.position.cm/api/telephones';
    final $headers = {
      'Authorization': token,
      'X-Authorization': apiKey,
      'Accept': 'application/json',
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }
}
