import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:core';
import 'package:flutter/foundation.dart';
import 'dart:async';

late final Database db;

class Game {
  final int id;
  final String name;

  const Game({required this.id, required this.name});
}

class Perso {
  final int id;
  final String name;
  final int gameId;
  final String growth;

  const Perso(
      {required this.id,
      required this.name,
      required this.gameId,
      required this.growth});
}

class DBControleur {
  Future<bool> databaseExists(String path) =>
      databaseFactory.databaseExists(path);

  Future CreateDB() async {
// Open the database and store the reference.
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'FEWiki.db');

    // open the database
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE games (id INTEGER PRIMARY KEY, name TEXT, lien TEXT)');
      await db.execute(
          'CREATE TABLE characterGame (id INTEGER PRIMARY KEY, name TEXT, gameId INTEGER, growth TEXT)');
      await db.execute(
          'CREATE TABLE gameStat (id INTEGER PRIMARY KEY, stats TEXT, gameId INTEGER)');
    });
  }

  void InsertDB(String table, var list) async {
// Open the database and store the reference.

    db.delete(table);
    int t = 1;
    for (var e in list) {
      e['attributes']['href'] = e['attributes']['href'].substring(26);
      db.insert("games",
          {"id": t, "name": e['title'], "lien": e['attributes']['href']});
      t++;
    }
  }

  void InsertDBPerso(int table, String list) async {
    db.insert("characterGame", {
      "name": list.substring(0, list.indexOf(',')),
      "gameId": table,
      "growth": list
    });
  }

  void InsertDBGameStats(int gameId, String stats) async {
    db.insert("gameStat", {"stats": stats, "gameId": gameId});
  }

  Future<List<Game>?> SelectDB() async {
    if (db.isOpen) {
// Query the table for all The Dogs.
      final List<Map<String, dynamic>> maps = await db.query('games');
      // Convert the List<Map<String, dynamic> into a List<Dog>.
      return List.generate(maps.length, (i) {
        return Game(
          id: maps[i]['id'],
          name: maps[i]['name'],
        );
      });
    }
  }

  Future<List<Perso>?> SelectDBPersoGame(int gameId) async {
    if (db.isOpen) {
// Query the table for all The Dogs.
      final List<Map<String, dynamic>> maps = await db
          .rawQuery('SELECT * FROM characterGame WHERE gameId=?', [gameId]);

      // Convert the List<Map<String, dynamic> into a List<Dog>.
      return List.generate(maps.length, (i) {
        return Perso(
          id: maps[i]['id'],
          name: maps[i]['name'],
          gameId: maps[i]['gameId'],
          growth: maps[i]['growth'],
        );
      });
    }
  }

  Future<List<String>?> SelectDBGrowthList(int gameId) async {
    if (db.isOpen) {
// Query the table for all The Dogs.
      final List<Map<String, dynamic>> maps =
          await db.rawQuery('SELECT * FROM gameStat WHERE gameId=?', [gameId]);
      return maps[0]["stats"].split(',');
    }
  }

  void DropDBPersoGame() async {
    db.delete("characterGame");
  }

  void DropDBStatsGame() async {
    db.delete("gameStat");
  }
}
