import 'package:chaleno/chaleno.dart';
import 'package:fe_wiki/view/character.dart';
import 'package:flutter/material.dart';
import '../toolbox.dart';
import '../DB.dart';
import '../main.dart';
import 'package:web_scraper/web_scraper.dart';
import 'dart:core';

late List<Map> list;

class updateDb extends StatefulWidget {
  const updateDb({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<updateDb> createState() => _updateDb();
}

class _updateDb extends State<updateDb> {
  Future<void> Scrape() async {
    var webScraper = WebScraper('https://serenesforest.net');
    await webScraper.loadWebPage('');
    var s = webScraper
        .getElement("body > div > div > div > ul > li > ul > li > a", ["href"]);

    for (var i = 0; i < 14; i++) {
      s.removeLast();
    }

    for (var i = 0; i < 16; i++) {
      s.removeAt(0);
    }
    s.removeAt(5);
    s.removeAt(15);
    s.removeAt(15);
    s.removeAt(3);
    s.removeAt(11);
    s.removeAt(11);

    List<String> listGame = List<String>.filled(s.length, "");
    database.InsertDB("games", s);
    database.DropDBPersoGame();
    database.DropDBStatsGame();
    int conteTemp = 1;
    for (var e in s) {
      if (conteTemp == 10 || conteTemp == 11) {
        await webScraper.loadWebPage(
            '/${e['attributes']['href']}characters/growth-rates/default/');
      } else {
        await webScraper
            .loadWebPage('/${e['attributes']['href']}characters/growth-rates/');
      }
      var temp = webScraper.getElement("tbody > tr > th", [""]);
      List<String> listStats = [];

      for (var elem in temp) {
        listStats.add(elem["title"]);
      }
      listStats = listStats.toSet().toList();
      if (conteTemp == 7) {
        listStats.removeLast();
        listStats.removeLast();
      }
      String statsTrier = listStats.join(',');
      database.InsertDBGameStats(conteTemp, statsTrier);

      temp = webScraper.getElement("tbody > tr > td", [""]);
      double totalTemp = temp.length / listStats.length;
      for (var i = 0; i < totalTemp; i++) {
        List<String> listBuffer = [];
        for (var i = 0; i < listStats.length; i++) {
          listBuffer.add(temp[0]["title"]);
          temp.removeAt(0);
        }

        String persoAjout = listBuffer.join(',');
        database.InsertDBPerso(conteTemp, persoAjout);
      }

      conteTemp++;
    }
    done = true;
    setState(() {});
  }

  bool done = false;

  @override
  void initState() {
    super.initState();
    Scrape();
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
        title: Text("Update"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Container(
            child: done
                ? //check if loading is true or false
                Text("Update Done") //show this text on loading = false
                : //show progress on loading = true
                CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.purple))),
      ),
    );
  }
}
