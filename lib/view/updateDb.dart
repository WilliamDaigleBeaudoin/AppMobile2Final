import 'package:chaleno/chaleno.dart';
import 'package:flutter/material.dart';
import '../toolbox.dart';
import 'package:web_scraper/web_scraper.dart';

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
  void Scrape() async {
    var webScraper = WebScraper('https://www.amazon.ca');

    await webScraper.loadWebPage(
        '/s?k=cuisine&crid=1I57A0E72Z7JA&sprefix=cuisine%2Caps%2C94&ref=nb_sb_noss_1');

    var s = webScraper.getElement("div > div > h2 > a > span", [""]);
    //var webScraper = WebScraper('https://fireemblem.fandom.com');
    // await webScraper.loadWebPage('');
    //var s = webScraper.getElement("table > tbody > tr > th > i > a", [""]);
    // for (var e in s) {
    // print(e);
    //}
  }

  @override
  void initState() {
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
        title: Text("Update"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Container(
          child: Stack(children: <Widget>[
            Text("classe"),
          ]),
        ),
      ),
    );
  }
}
