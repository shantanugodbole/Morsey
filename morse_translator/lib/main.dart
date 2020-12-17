import 'package:flutter/material.dart';
import 'package:morse_translator/screens/home.dart';
// import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String url =
      "http://api.funtranslations.com/translate/morse.json?text=Hello World";

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          accentColor: Color(0xFF442C2E), backgroundColor: Color(0xFFFEDBD0)),
    );
  }
}
