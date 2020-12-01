import 'package:http/http.dart' as http;

class Network {
  Network();
  static String url = 'http://setel.axzae.com/homework/';

  static Future fetchData([int page, int limit]) async {
    var response;
    response = await http.get(url);
    if (response.statusCode != 200) {
      print('response error = ' + response.body);
    }
    return response.body;
  }
}
