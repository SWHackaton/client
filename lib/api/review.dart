import 'dart:convert';

import 'package:mockup/api/main.dart';

import 'package:http/http.dart';

class ReviewClient extends APIClient {
  Future<dynamic> getAddress(String storeName, String addr) async {
    Response response = await getRequest('/review/read?store_name=$storeName&addr=$addr');
    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    }
    throw Error();
  }

  Future<dynamic> getReviewAll() async {
    Response response = await getRequest('/review/');
    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    }
    throw Error();
  }

  Future<dynamic> getReviewDetail(String store) async {
    Response response = await getRequest('/review/detail?store=$store');
    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    }
    throw Error();
  }
}
