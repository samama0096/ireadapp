import 'dart:async';

import 'package:flutter/material.dart';

import 'ex.dart';


class splash extends StatefulWidget {
  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3),
        (){Navigator.pushAndRemoveUntil(context, new MaterialPageRoute(builder: (BuildContext context){return MyApp();}), (route) => false);});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children:[ Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(color: Colors.black87),
                child: Padding(
                  padding: const EdgeInsets.only(top: 85),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.redAccent,
                        radius: 60,
                        child: Icon(
                          Icons.toys,
                          size: 50,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(
                        height: 135,
                        width: MediaQuery.of(context).size.width,
                      ),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "i",
                              style: TextStyle(
                                  fontSize: 40, color: Colors.redAccent)),
                          TextSpan(text: "Read", style: TextStyle(fontSize: 40)),
                          TextSpan(
                              text: ".",
                              style: TextStyle(color: Colors.redAccent, fontSize: 40))
                        ]),
                      ),
                      SizedBox(
                        height: 10,
                        width: MediaQuery.of(context).size.width,
                      ),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "The Captions you need are here my dear!",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white)),
                        ]),
                      ),
                      SizedBox(
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                      ),
                      SizedBox(child: CircularProgressIndicator( valueColor: new AlwaysStoppedAnimation<Color>(Colors.white), ), height: 15,width: 15,),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Text("Wait while loading the captions!", style: TextStyle(
                          color: Colors.white70, fontSize: 11.5
                        ),),
                      )
                    ],
                  ),
                ),
              ),
            ),]
          )
        ],
      ),
    );
  }
}
