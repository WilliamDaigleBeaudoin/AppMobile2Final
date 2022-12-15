import 'package:flutter/material.dart';
import '../DB.dart';
import '../main.dart';
import '../toolbox.dart';

class StatEtGrowth {
  final String stats;
  final String growths;

  const StatEtGrowth({required this.stats, required this.growths});
}

class character extends StatefulWidget {
  const character({Key? key, required this.perso}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final Perso perso;

  @override
  State<character> createState() => _character();
}

class _character extends State<character> {
  late List<StatEtGrowth> listAAficher = [];
  late List<String> stat = [];
  late List<String> growth = [];
  @override
  void initState() {
    super.initState();
    select();
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
        title: Text(widget.perso.name),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: DataTable(
            columns: const <DataColumn>[
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Stats',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Growth',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            ],
            rows: listAAficher
                .map<DataRow>((e) => DataRow(cells: [
                      DataCell(Text(e.stats)),
                      DataCell(Text(e.growths))
                    ]))
                .toList()),
      ),
    );
  }

  void select() async {
    stat = await database.SelectDBGrowthList(widget.perso.gameId) ?? [];
    growth = widget.perso.growth.split(',');
    for (var i = 0; i < stat.length; i++) {
      listAAficher.add(StatEtGrowth(stats: stat[i], growths: growth[i]));
    }
    setState(() {});
  }
}
