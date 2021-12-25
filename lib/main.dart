import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:screenshot/screenshot.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

final myList = [
  "LINE NUMBER 1 OF TEXT",
  "LINE NUMBER 2 OF TEXT",
  "LINE NUMBER 3 OF TEXT",
  "LINE NUMBER 4 OF TEXT",
  "LINE NUMBER 5 OF TEXT",
  "LINE NUMBER 6 OF TEXT",
  "LINE NUMBER 7 OF TEXT",
  "LINE NUMBER 8 OF TEXT",
  "LINE NUMBER 9 OF TEXT",
  "LINE NUMBER 10 OF TEXT",
  "LINE NUMBER 11 OF TEXT",
  "LINE NUMBER 5 OF TEXT",
  "LINE NUMBER 6 OF TEXT",
  "LINE NUMBER 7 OF TEXT",
  "LINE NUMBER 8 OF TEXT",
  "LINE NUMBER 9 OF TEXT",
  "LINE NUMBER 10 OF TEXT",
  "LINE NUMBER 11 OF TEXT",
];

class _HomePageState extends State<HomePage> {


  Uint8List? _imageFile;

  ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: screenshotController,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Screenshot Practice "),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.camera_alt),
          onPressed: (){
            screenshotController.capture().then((var image) {
              print("PICKED IMAGE: ${image}");
              var alert = AlertDialog(
                  content: Card(
                    child: Image.memory(image!),
                  ),
                  actions: [
                    TextButton(onPressed: (){
                      Navigator.pop(context);

                      }, child: Text("Cancel"),),
                  ],
                );

              return showDialog(context: context,
                  builder: (BuildContext context){
                return alert;
                  }

                  );
            },


            ).catchError((onerror){print(onerror);});
          },
        ),
        body: Column(
          children: [
            Flexible(
              child: ListView(children: [
                const Text("My LIST: "),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: myList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text("TITLE: ${myList[index]} + $index"),
                      );
                    })
              ]),
            )
          ],
        ),
      ),
    );
  }
}
