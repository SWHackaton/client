import 'package:http/http.dart';

import 'package:mockup/api/main.dart';

class AuthClient extends APIClient {
  Future<Response> authLogin(String token) {
    return postRequest('/kakao/auth', body: { 'token': token });
  }
}