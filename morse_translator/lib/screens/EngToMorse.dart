import 'package:flutter/material.dart';
import '../services/api.dart';
import 'package:clipboard_manager/clipboard_manager.dart';

class EngToMorse extends StatefulWidget {
  @override
  _EngToMorseState createState() => _EngToMorseState();
}

class _EngToMorseState extends State<EngToMorse> {
  // String inputText = "";
  final myController = TextEditingController();
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
              padding: EdgeInsets.all(50),
              // height: MediaQuery.of(context).size.height / 8,
              child: Text(
                "Translate from English to Morse",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30),
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
                "Encode!",
                style: TextStyle(fontSize: 22),
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
                ClipboardManager.copyToClipBoard(myController.text)
                    .then((result) {
                  final snackBar = SnackBar(
                    content: Text('Copied to Clipboard'),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {},
                    ),
                  );
                  Scaffold.of(context).showSnackBar(snackBar);
                });
              },
              child: Text(
                "Copy",
                style: TextStyle(fontSize: 22),
              ),
              color: Color(0xFFFEDBD0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(300, 75, 5, 20),
              child: RaisedButton(
                onPressed: () {},
                child: Text(
                  "Share",
                  style: TextStyle(fontSize: 22),
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
    );
  }
}
