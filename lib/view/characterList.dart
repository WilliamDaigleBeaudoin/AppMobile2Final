import 'package:fe_wiki/view/character.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import '../toolbox.dart';

class characterList extends StatefulWidget {
  const characterList({Key? key, required this.game}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String game;

  @override
  State<characterList> createState() => _characterList();
}

class _characterList extends State<characterList> {
  late List<Widget> listPersonage = [];

  @override
  void initState() {
    listPersonage.add(const BouttonDestinationGames(
        text: "Richard",
        textColor: Colors.black,
        borderColor: Colors.deepPurple,
        destination: character(
          perso: "Richard",
        )));
    listPersonage.add(const BouttonDestinationGames(
        text: "Gaiden",
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
        title: Text(widget.game),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: ListView(
          children: listPersonage,
        ),
      ),
    );
  }
}
