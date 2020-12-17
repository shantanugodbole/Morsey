import 'package:http/http.dart' as http;
// import 'dart:convert';

class GetData {
  getData(String url) async {
    http.Response response = await http.get(url);
    print(response.body);
    // var decodedResponse = jsonDecode(response.body)['contents']['translated'];
    // print(decodedResponse.toString());
  }
}
