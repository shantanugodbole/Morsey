import 'package:http/http.dart' as http;

class GetData {
  void getData(String url) async {
    var response = await http.get(url);
    print(response.body);
  }
}
