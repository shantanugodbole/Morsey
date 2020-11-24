import 'package:flutter/material.dart';

class EngToMorse extends StatefulWidget {
  @override
  _EngToMorseState createState() => _EngToMorseState();
}

class _EngToMorseState extends State<EngToMorse> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Text("Translate from English to Morse"),
        Text("Input in Engish"),
        TextField(
          autocorrect: true,
        ),
        Text("Encoded message!"),
        RaisedButton(
          onPressed: () {},
          child: Text("Share"),
        ),
      ],
    ),
    );
  }
}
