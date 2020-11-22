import 'package:flutter/material.dart';
import './EngToMorse.dart';
import './MorseToEng.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var url =
      "https://api.funtranslations.com/translate/morse.json?text=Hello World";

  @override
  void initState() async {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      print(response);
    } else {
      print(response.statusCode);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("Welcome to Morsapp!"),
          RaisedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EngToMorse()));
            },
            child: Text("English -> Morse"),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MorseToEng()));
            },
            child: Text("Morse -> English"),
          )
        ],
      ),
    );
  }
}
