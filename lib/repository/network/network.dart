import 'package:http/http.dart' as http;

class Network {
  Network();
  static String url =
      'https://5fbf5061fd14be00167487a2.mockapi.io/api/v1/restaurants';

  static Future fetchData([int page, int limit]) async {
    var response;
    if (page == null && limit == null) {
      response = await http.get(url);
    } else {
      Map<String, dynamic> params = {'page': page, 'limit': limit};
      response = await http.get(url, headers: params);
    }
    if (response.statusCode != 200) {
      print('response error = ' + response.body);
    }
    print('response = ' + response.body);
    return response.body;
  }
}
