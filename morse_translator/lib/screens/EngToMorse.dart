import 'package:flutter/material.dart';
import 'dart:convert';
import '../services/api.dart';

class EngToMorse extends StatefulWidget {
  @override
  _EngToMorseState createState() => _EngToMorseState();
}

class _EngToMorseState extends State<EngToMorse> {
  var url =
      "http://api.funtranslations.com/translate/morse.json?text=Hello World";

  @override
  void initState() {
    final apiCaller = GetData();
    var response = apiCaller.getData(url);
    print(response);
    // var decodedResponse = jsonDecode(response)['contents']['translated'];
    // print(decodedResponse.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Color(0xFFFEEAE6),
        child: new Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(40),
                height: MediaQuery.of(context).size.height/8,
                child: Text("Translate from English to Morse", textAlign: TextAlign.center, style: TextStyle(fontSize: 20),),
              ),
              Container(
                child: Text("Input in Engish"),
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
                child: Text("Encode!"),
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
