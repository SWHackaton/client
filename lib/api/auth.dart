import 'dart:convert';

import 'package:http/http.dart';

import 'package:mockup/api/main.dart';

class AuthClient extends APIClient {
  Future authLogin(String token) async {
    Response response = await postRequest('/kakao/auth', body: { 'token': token });
    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    }
    throw Error();
  }
}