import 'dart:convert';

import 'package:mockup/api/main.dart';

import 'package:http/http.dart';

class StoreClient extends APIClient {
  Future<dynamic> getSearchResult(String searchWord) async {
    Response response = await getRequest('/store/search?q=$searchWord');
    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    }
    throw Error();
  }

  Future<dynamic> getSelectCategory(String category) async {
    Response response = await getRequest('/store/category/$category');
    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    }
    throw Error();
  }
}
