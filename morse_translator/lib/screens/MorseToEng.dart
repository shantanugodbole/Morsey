import 'package:flutter/material.dart';
import '../services/api.dart';
import 'package:clipboard_manager/clipboard_manager.dart';
import 'package:share/share.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';

class MorseToEng extends StatefulWidget {
  @override
  _MorseToEngState createState() => _MorseToEngState();
}

class _MorseToEngState extends State<MorseToEng> {
  final GetData object = new GetData();
  String inputText = "";
  final myController = TextEditingController();
  final inputController = TextEditingController();

  void translateToEnglish() async {
    var url =
        "http://api.funtranslations.com/translate/morse2english.json?text=" +
            inputController.text;
    var response = await object.getData(url);
    myController.text = jsonDecode(response)['contents']['translated'];
  }

  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFFFEEAE6),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(50),
              child: Text(
                "Translate from Morse to English",
                textAlign: TextAlign.center,
                style:
                    GoogleFonts.allan(color: Color(0xFF442C2E), fontSize: 42),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: TextField(
                style: TextStyle(fontSize: 16),
                controller: inputController,
                maxLines: 6,
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    fontSize: 16,
                  ),
                  hintText: "Enter the coded message!",
                  filled: true,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.brown),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.brown),
                  ),
                ),
                autocorrect: true,
                cursorColor: Colors.brown,
                // cursorRadius: Radius.circular(20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: MaterialButton(
                onPressed: () {
                  translateToEnglish();
                  FocusManager.instance.primaryFocus.unfocus();
                },
                child: Text(
                  "Decode",
                  style:
                      GoogleFonts.allan(color: Color(0xFF442C2E), fontSize: 22),
                ),
                color: Color(0xFFFEDBD0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: TextField(
                style: TextStyle(fontSize: 16),
                controller: myController,
                maxLines: 6,
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    fontSize: 16,
                  ),
                  hintText: "Decoded message will appear here",
                  filled: true,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.brown),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.brown),
                  ),
                ),
                autocorrect: true,
                cursorColor: Colors.brown,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: MaterialButton(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                onPressed: () {
                  inputText = myController.text;
                  ClipboardManager.copyToClipBoard(myController.text);
                  myController.text = "Message copied to clipboard!";
                },
                child: Text(
                  "Copy",
                  style:
                      GoogleFonts.allan(color: Color(0xFF442C2E), fontSize: 22),
                ),
                color: Color(0xFFFEDBD0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: MaterialButton(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Back",
                        style: GoogleFonts.allan(
                            color: Color(0xFF442C2E), fontSize: 22),
                      ),
                      color: Color(0xFFFEDBD0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  Container(
                    child: MaterialButton(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      onPressed: () {
                        if (inputText == "") {
                          inputText = myController.text;
                          ClipboardManager.copyToClipBoard(myController.text);
                          myController.text = "Message copied to clipboard!";
                          Share.share(inputText);
                        } else {
                          Share.share(inputText);
                        }
                      },
                      child: Text(
                        "Share",
                        style: GoogleFonts.allan(
                            color: Color(0xFF442C2E), fontSize: 22),
                      ),
                      color: Color(0xFFFEDBD0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
