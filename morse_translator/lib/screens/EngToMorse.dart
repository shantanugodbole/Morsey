import 'package:flutter/material.dart';
// import '../services/api.dart';
import 'package:clipboard_manager/clipboard_manager.dart';
import 'package:share/share.dart';
import 'package:google_fonts/google_fonts.dart';

class EngToMorse extends StatefulWidget {
  @override
  _EngToMorseState createState() => _EngToMorseState();
}

class _EngToMorseState extends State<EngToMorse> {
  String inputText = "";
  final myController = TextEditingController();
  var url =
      "http://api.funtranslations.com/translate/morse.json?text=Hello World";

  @override
  void initState() {
    // final apiCaller = GetData();
    // var response = apiCaller.getData(url);
    // print(response);
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
              padding: EdgeInsets.all(50),
              // height: MediaQuery.of(context).size.height / 8,
              child: Text(
                "Translate from English to Morse",
                textAlign: TextAlign.center,
                style: GoogleFonts.allan(color: Color(0xFF442C2E), fontSize: 42),
                // style: TextStyle(
                //   fontSize: 30,
                //   color: Color(0xFF442C2E),
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: TextField(
                maxLines: 8,
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    fontSize: 18,
                  ),
                  hintText: "Enter your secret message!",
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
            RaisedButton(
              onPressed: () {},
              child: Text(
                "Encode",
                style: GoogleFonts.allan(color: Color(0xFF442C2E), fontSize: 34),
                // style: TextStyle(
                //   fontSize: 22,
                //   color: Color(0xFF442C2E),
                // ),
              ),
              color: Color(0xFFFEDBD0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: TextField(
                controller: myController,
                maxLines: 8,
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    fontSize: 18,
                  ),
                  hintText: "Your message encoded in Morse will appear here",
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
            RaisedButton(
              onPressed: () {
                inputText = myController.text;
                ClipboardManager.copyToClipBoard(myController.text);
                myController.text = "Message copied to clipboard!";
                // showSnackBar();
              },
              child: Text(
                "Copy",
                style: GoogleFonts.allan(color: Color(0xFF442C2E), fontSize: 34),
                // style: TextStyle(
                //   fontSize: 22,
                //   color: Color(0xFF442C2E),
                // ),
              ),
              color: Color(0xFFFEDBD0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              // mainAxisSize: MainAxisSize.values[0],
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  // padding: EdgeInsets.fromLTRB(300, 90, 5, 20),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Back",
                      style: GoogleFonts.allan(color: Color(0xFF442C2E), fontSize: 34),
                      // style: TextStyle(
                      //   fontSize: 22,
                      //   color: Color(0xFF442C2E),
                      // ),
                    ),
                    color: Color(0xFFFEDBD0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                Container(
                  // padding: EdgeInsets.fromLTRB(300, 90, 5, 20),
                  child: RaisedButton(
                    onPressed: () {
                      if (inputText.isEmpty) {
                        throw ErrorDescription("Cannot share null message");
                      } else {
                        Share.share(inputText);
                      }
                    },
                    child: Text(
                      "Share",
                      style: GoogleFonts.allan(color: Color(0xFF442C2E), fontSize: 34),
                      // style: TextStyle(
                      //   fontSize: 22,
                      //   color: Color(0xFF442C2E),
                      // ),
                    ),
                    color: Color(0xFFFEDBD0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
