import 'dart:convert';

import 'package:mockup/api/main.dart';

import 'package:http/http.dart';

class LocationClient extends APIClient {
  Future<dynamic> getAddress() async {
    Response response = await getRequest('/gps/address/');
    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    }
    throw Error();
  }

  Future<Response> getLastTimeStamp() {
    return getRequest('/gps/timeline/last');
  }
}