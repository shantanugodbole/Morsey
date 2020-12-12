import 'package:flutter/material.dart';
import 'dart:convert';
import '../services/api.dart';

class MorseToEng extends StatefulWidget {
  @override
  _MorseToEngState createState() => _MorseToEngState();
}

class _MorseToEngState extends State<MorseToEng> {
  var url =
      "http://api.funtranslations.com/translate/morse2english.json?text=--%20---%20.-.%20...%20.%20%20%20%20%20-.-.%20---%20-..%20.%20%20%20%20%20..%20...%20%20%20%20%20.-%20%20%20%20%20-..%20..%20-%20%20%20%20%20.-%20-.%20-..%20%20%20%20%20-..%20.-%20....%20";

  @override
  void initState() {
    final apiCaller = GetData();
    var response = apiCaller.getData(url);
    // print(response);
    // var decodedResponse = jsonDecode(response)['contents']['translated'];
    // print(decodedResponse.toString());
    super.initState();
  }

  Widget build(BuildContext context) {
    return Material(
        color: Color(0xFFFEEAE6),
        child: new Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(40),
                height: MediaQuery.of(context).size.height/8,
                child: Text("Translate from Morse to English", textAlign: TextAlign.center, style: TextStyle(fontSize: 20),),
              ),
              Container(
                child: Text("Enter your Morse Code:"),
              ),
              TextField(
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.brown),
                  ),
                ),
                autocorrect: true,
              ),
              RaisedButton(
                onPressed: () {},
                child: Text("Decode!"),
                color: Color(0xFFFEDBD0),
              ),
              TextField(
                readOnly: true,
                autocorrect: true,
              ),
              RaisedButton(
                onPressed: () {},
                child: Text("Share"),
                color: Color(0xFFFEDBD0),
              ),
            ],
          ),
        ));
  }
}
