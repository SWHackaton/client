import 'package:mockup/api/main.dart';

import 'package:http/http.dart';

class LocationClient extends APIClient {
  Future<Response> getAddress() {
    return getRequest('/gps/map');
  }
}