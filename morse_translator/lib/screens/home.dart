import 'package:flutter/material.dart';
import './EngToMorse.dart';
import './MorseToEng.dart';
import '../services/api.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var url =
      "http://api.funtranslations.com/translate/morse.json?text=Hello World";

  @override
  void initState() {
    final apiCaller = GetData();
    apiCaller.getData(url);
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFEEAE6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(40),
            alignment: Alignment.center,
            child: Text(
              "Morsapp",
              style: TextStyle(
                  color: Colors.brown,
                  fontSize: 56,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(40),
            child: Text("Share information secretly!"),
          ),
          Row(
            children: [
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Color(0xFFFEDBD0),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EngToMorse()));
                },
                child: Text("English -> Morse"),
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Color(0xFFFEDBD0),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MorseToEng()));
                },
                child: Text("Morse -> English"),
              )
            ],
          ),
        ],
      ),
    );
  }
}
