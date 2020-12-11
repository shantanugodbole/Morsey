import 'package:flutter/material.dart';

class MorseToEng extends StatefulWidget {
  @override
  _MorseToEngState createState() => _MorseToEngState();
}

class _MorseToEngState extends State<MorseToEng> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("Translate from Morse to English"),
          Text("Input in Morse"),
          // TextField(
          //   autocorrect: true,
          // ),
          Text("Decoded message!"),
          RaisedButton(
            onPressed: () {},
            child: Text("Share"),
          ),
        ],
      ),
    );
  }
}
