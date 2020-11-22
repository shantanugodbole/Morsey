import 'package:flutter/material.dart';

class MorseToEng extends StatefulWidget {
  @override
  _MorseToEngState createState() => _MorseToEngState();
}

class _MorseToEngState extends State<MorseToEng> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Translate Morse to English!"),
    );
  }
}
