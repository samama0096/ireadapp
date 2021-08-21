import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final userRef = Firestore.instance.collection('Captions');
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade900,
          title: Text("iRead"),
          centerTitle: true,
        ),
        backgroundColor: Colors.grey.shade900,
        body: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: StreamBuilder<QuerySnapshot>(
              stream: userRef.snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final List<Text> datas = snapshot.data.documents
                    .map((doc) => Text(
                          doc["c"],
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ))
                    .toList();

                return ListView.builder(itemBuilder: (context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8, bottom: 8, left: 3, right: 3),
                          child: ListTile(
                            trailing: Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.white30,
                              size: 15,
                            ),
                            leading: Icon(
                              Icons.whatshot,
                              color: Colors.white,
                            ),
                            title: datas[index],
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Text(
                                "b y    S a m o !",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 11,
                                    fontStyle: FontStyle.italic),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: size.width * 0.6,
                          child: Center(
                              child: Text(
                            "- - -",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          )),
                        ),
                        SizedBox(
                          height: 30,
                          width: size.width,
                        )
                      ],
                    ),
                  );
                });
              }),
        ));
  }
}
