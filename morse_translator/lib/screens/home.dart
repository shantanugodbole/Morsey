import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './EngToMorse.dart';
import './MorseToEng.dart';
// import '../services/api.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // var url =
  //     "http://api.funtranslations.com/translate/morse.json?text=Hello World";

  // @override
  // void initState() {
  //   final apiCaller = GetData();
  //   var response = apiCaller.getData(url);
  //   print(response);
  //   var decodedResponse = jsonDecode(response)['contents']['translated'];
  //   print(decodedResponse);
  //   super.initState();
  // }


  @override
  Widget build(BuildContext context) {
  final screenHeight = MediaQuery.of(context).size.height;
  final screenWidth = MediaQuery.of(context).size.width;
 
    return Material(
        color: Color(0xFFFEEAE6),
        child: new SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: screenHeight/15),
                height: screenHeight / 4,
                // padding: EdgeInsets.all(20),
                alignment: Alignment.center,
                child: Text(
                  "Morsey",
                  style: GoogleFonts.permanentMarker(
                      color: Color(0xFF442C2E),
                      fontWeight: FontWeight.bold,
                      fontSize: 72),
                ),
              ),
              Container(
                // height: MediaQuery.of(context).size.height/4,
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 70),
                child: Text(
                  "Share information secretly!",
                  style:
                      GoogleFonts.allan(color: Color(0xFF442C2E), fontSize: 30),
                  // style: TextStyle(
                  //   fontSize: 32,
                  //   color: Color(0xFF442C2E),
                  // ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "Morsey is a Morse code translator which helps you to convert secret messages into code and then share it with your friends",
                  style:
                      GoogleFonts.allan(color: Color(0xFF442C2E), fontSize: 25),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Color(0xFFFEDBD0),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EngToMorse()));
                    },
                    child: Text(
                      "English -> Morse",
                      style: GoogleFonts.allan(
                          color: Color(0xFF442C2E), fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Color(0xFFFEDBD0),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MorseToEng()));
                    },
                    child: Text(
                      "Morse -> English",
                      style: GoogleFonts.allan(
                          color: Color(0xFF442C2E), fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
