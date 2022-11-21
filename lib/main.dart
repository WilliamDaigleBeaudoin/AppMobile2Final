// ignore_for_file: unnecessary_new

import 'package:fe_wiki/view/characterList.dart';
import 'package:fe_wiki/view/updateDb.dart';
import 'package:flutter/material.dart';
import 'toolbox.dart';
import 'package:web_scraper/web_scraper.dart';

Future<void> Scrape() async {
  var webScraper = WebScraper('https://fireemblem.fandom.com');
  await webScraper.loadWebPage('/wiki/Fire_Emblem_(series)');
  var s = webScraper.getElement("table.wikitable", [""]);
  for (var e in s) {
    print(e);
  }
}

void main() async {
  await Scrape();
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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<Widget> buttonestination = [];

  @override
  void initState() {
    buttonestination.add(const BouttonDestination(
        text: "Dark Dragon and the blade of light",
        textColor: Colors.black,
        borderColor: Colors.deepPurple,
        destination: characterList(
          game: "Dark Dragon and the blade of light",
        )));
    buttonestination.add(const BouttonDestination(
        text: "Update",
        textColor: Colors.black,
        borderColor: Colors.deepPurple,
        destination: updateDb()));
    buttonestination.add(const BouttonDestination(
        text: "Mistery of the emblem",
        textColor: Colors.black,
        borderColor: Colors.deepPurple,
        destination: MyHomePage(
          title: "wiki",
        )));
    buttonestination.add(const BouttonDestination(
        text: "Genealogie of the holy war",
        textColor: Colors.black,
        borderColor: Colors.deepPurple,
        destination: MyHomePage(
          title: "wiki",
        )));
    buttonestination.add(const BouttonDestination(
        text: "Thracia 776",
        textColor: Colors.black,
        borderColor: Colors.deepPurple,
        destination: MyHomePage(
          title: "wiki",
        )));
    buttonestination.add(const BouttonDestination(
        text: "Binding Blade",
        textColor: Colors.black,
        borderColor: Colors.deepPurple,
        destination: MyHomePage(
          title: "wiki",
        )));
    buttonestination.add(const BouttonDestination(
        text: "Blazing Sword",
        textColor: Colors.black,
        borderColor: Colors.deepPurple,
        destination: MyHomePage(
          title: "wiki",
        )));
    buttonestination.add(const BouttonDestination(
        text: "Sacred Stones",
        textColor: Colors.black,
        borderColor: Colors.deepPurple,
        destination: MyHomePage(
          title: "wiki",
        )));
    buttonestination.add(const BouttonDestination(
        text: "Path of Radiance",
        textColor: Colors.black,
        borderColor: Colors.deepPurple,
        destination: MyHomePage(
          title: "wiki",
        )));
    buttonestination.add(const BouttonDestination(
        text: "Radiant Dawn",
        textColor: Colors.black,
        borderColor: Colors.deepPurple,
        destination: MyHomePage(
          title: "wiki",
        )));
    buttonestination.add(const BouttonDestination(
        text: "Shadow Dragon",
        textColor: Colors.black,
        borderColor: Colors.deepPurple,
        destination: MyHomePage(
          title: "wiki",
        )));
    buttonestination.add(const BouttonDestination(
        text: "New Mistery of the Emblem",
        textColor: Colors.black,
        borderColor: Colors.deepPurple,
        destination: MyHomePage(
          title: "wiki",
        )));
    buttonestination.add(const BouttonDestination(
        text: "Awakening",
        textColor: Colors.black,
        borderColor: Colors.deepPurple,
        destination: MyHomePage(
          title: "wiki",
        )));
    buttonestination.add(const BouttonDestination(
        text: "Fate",
        textColor: Colors.black,
        borderColor: Colors.deepPurple,
        destination: MyHomePage(
          title: "wiki",
        )));
    buttonestination.add(const BouttonDestination(
        text: "Echoes",
        textColor: Colors.black,
        borderColor: Colors.deepPurple,
        destination: MyHomePage(
          title: "wiki",
        )));
    buttonestination.add(const BouttonDestination(
        text: "Three House",
        textColor: Colors.black,
        borderColor: Colors.deepPurple,
        destination: MyHomePage(
          title: "wiki",
        )));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Container(
              child: Stack(children: <Widget>[
        ListView(
          children: buttonestination,
        ),
      ]))),
    );
  }
}
