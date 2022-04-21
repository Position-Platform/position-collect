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
    final $url = 'http://10.0.2.2:8000/api/auth/login';
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
    final $url = 'http://10.0.2.2:8000/api/user/me';
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
    final $url = 'http://10.0.2.2:8000/api/auth/password/forgot';
    final $headers = {
      'Accept': 'application/json',
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> resetPassword(Map<String, dynamic> body) {
    final $url = 'http://10.0.2.2:8000/api/auth/password/reset';
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
    final $url = 'http://10.0.2.2:8000/api/auth/logout';
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
    final $url = 'http://10.0.2.2:8000/api/tracking';
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
  Future<Response<dynamic>> getbatiments(String token, String apiKey) {
    final $url = 'http://10.0.2.2:8000/api/batiments';
    final $headers = {
      'Authorization': token,
      'X-Authorization': apiKey,
      'Accept': 'application/json',
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getbatimentsbyId(
      String token, String apiKey, int idBatiment) {
    final $url = 'http://10.0.2.2:8000/api/batiments/$idBatiment';
    final $headers = {
      'Authorization': token,
      'X-Authorization': apiKey,
      'Accept': 'application/json',
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> deletebatiment(
      String token, String apiKey, int idBatiment) {
    final $url = 'http://10.0.2.2:8000/api/batiments/$idBatiment';
    final $headers = {
      'Authorization': token,
      'X-Authorization': apiKey,
      'Accept': 'application/json',
    };

    final $request = Request('DELETE', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> addbatiment(
      String token, String apiKey, Map<String, dynamic> body) {
    final $url = 'http://10.0.2.2:8000/api/batiments';
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
  Future<Response<dynamic>> updatebatiment(
      String token, String apiKey, Map<String, dynamic> body, int idBatiment) {
    final $url = 'http://10.0.2.2:8000/api/batiments/$idBatiment';
    final $headers = {
      'Authorization': token,
      'X-Authorization': apiKey,
      'Accept': 'application/json',
    };

    final $body = body;
    final $request =
        Request('PUT', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> searchetablissement(String apiKey, String query) {
    final $url = 'http://10.0.2.2:8000/api/search/etablissements';
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
    final $url = 'http://10.0.2.2:8000/api/etablissements';
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
  Future<Response<dynamic>> updateetablissement(String token, String apiKey,
      Map<String, dynamic> body, int idEtablissement) {
    final $url = 'http://10.0.2.2:8000/api/etablissements/$idEtablissement';
    final $headers = {
      'Authorization': token,
      'X-Authorization': apiKey,
      'Accept': 'application/json',
    };

    final $body = body;
    final $request =
        Request('PUT', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> deleteetablissement(
      String token, String apiKey, int idEtablissement) {
    final $url = 'http://10.0.2.2:8000/api/etablissements/$idEtablissement';
    final $headers = {
      'Authorization': token,
      'X-Authorization': apiKey,
      'Accept': 'application/json',
    };

    final $request = Request('DELETE', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> addhoraire(
      String token, String apiKey, Map<String, dynamic> body) {
    final $url = 'http://10.0.2.2:8000/api/horaires';
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
  Future<Response<dynamic>> updatehoraire(
      String token, String apiKey, Map<String, dynamic> body, int idHoraire) {
    final $url = 'http://10.0.2.2:8000/api/horaires/$idHoraire';
    final $headers = {
      'Authorization': token,
      'X-Authorization': apiKey,
      'Accept': 'application/json',
    };

    final $body = body;
    final $request =
        Request('PUT', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> deletehoraire(
      String token, String apiKey, int idHoraire) {
    final $url = 'http://10.0.2.2:8000/api/horaires/$idHoraire';
    final $headers = {
      'Authorization': token,
      'X-Authorization': apiKey,
      'Accept': 'application/json',
    };

    final $request = Request('DELETE', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> deleteimage(
      String token, String apiKey, int idImage) {
    final $url = 'http://10.0.2.2:8000/api/images/$idImage';
    final $headers = {
      'Authorization': token,
      'X-Authorization': apiKey,
      'Accept': 'application/json',
    };

    final $request = Request('DELETE', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getsouscategories(String apiKey) {
    final $url = 'http://10.0.2.2:8000/api/souscategories';
    final $headers = {
      'X-Authorization': apiKey,
      'Accept': 'application/json',
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }
}
