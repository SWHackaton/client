import 'dart:convert';

import 'package:http/http.dart';

class APIClient extends BaseClient {
  Map<String, String> _defaultHeader = {
    'Content-Type' : 'application/json',
    'Accept' : 'application/json',
  };
  final Client _client = Client();

  // static const String baseURL = 'http://118.67.131.34';
  static const String baseURL = 'http://127.0.0.1:8080';

  @override
  Future<StreamedResponse> send(BaseRequest request) {
    return _client.send(request);
  }

  Future<Response> getRequest(String path, {Map<String, String>? headers}) {
    return _client.get(Uri.parse(baseURL + path), headers: _mergeHeader(headers));
  }

  Future<Response> postRequest(String path, {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    return _client.post(Uri.parse(baseURL + path), body: body, encoding: encoding, headers: _mergeHeader(headers));
  }

  Future<Response> deleteRequest(String path, {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    return _client.delete(Uri.parse(baseURL + path), body: body, encoding: encoding, headers: _mergeHeader(headers));
  }

  Future<Response> putRequest(String path, {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    return _client.put(Uri.parse(baseURL + path), body: body, encoding: encoding, headers: _mergeHeader(headers));
  }

  Map<String, String> _mergeHeader(Map<String, String>? headers) {
    return {..._defaultHeader, ...?headers};
  }

  void setHeader(Map<String, String> headers) {
    _defaultHeader = headers;
  }
}