import 'package:http/http.dart' as http;

class GetData {
  var url =
      "https://api.funtranslations.com/translate/morse.json?text=Hello World";
  void getData() async {
    var response = http.get(url);
    print(response);
  }
}
