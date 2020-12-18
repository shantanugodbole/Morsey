import 'package:http/http.dart' as http;
// import 'dart:convert';

class GetData {
  getData(String url) async {
    http.Response response = await http.get(url);
    return response.body;
  }
}
