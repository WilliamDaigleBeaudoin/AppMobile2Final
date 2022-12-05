import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:core';
import 'package:flutter/foundation.dart';
import 'dart:async';

late List<Map>? gamelist = null;
late final Database db;

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
      await db.execute('CREATE TABLE games (id INT AUTOINCREMENT, name TEXT)');
    });
    // open the database
    /*Database databaseCharacter = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE characterGame (id INTEGER PRIMARY KEY, name TEXT, gameId INTEGER)');
    });*/
    /* // open the database
    Database databaseCharacterInfo = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db
          .execute('CREATE TABLE characterInfo (id INTEGER PRIMARY KEY, name TEXT)');
    });*/
  }

  void InsertDB(String table, List<String> list) async {
// Open the database and store the reference.
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'FEWiki.db');
    db.insert("games", {"name": "test1234"});
    /*switch (table) {
      case "games":
        // open the database
        Database database = await openDatabase(path, version: 1);
        // Insert some records in a transaction
        await database.transaction((txn) async {
          for (var e in list) {
            await txn.rawInsert('INSERT INTO games (name) VALUES("$e")');
          }
        });
        break;
      default:
        break;
    }*/
  }

  void SelectDB() async {
// Open the database and store the reference.
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'FEWiki.db');
    if (databaseExists(path) == true) {
// open the database
      Database database = await openDatabase(path, version: 1);
// Get the records
      gamelist = await database.rawQuery('SELECT name FROM games');
    }
  }

  List<Map>? GetList() {
    return gamelist;
  }

  void InsertDBStuff(String dateTime, String nom, int score) async {
    // Open the database and store the reference.
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'highscore.db');
// open the database
    Database database = await openDatabase(path, version: 1);
    // Insert some records in a transaction
    await database.transaction((txn) async {
      await txn.rawInsert(
          'INSERT INTO score(datetime, nom, score) VALUES("$dateTime", "$nom", $score)');
    });
  }

  void DropDB() async {
    // Open the database and store the reference.
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'highscore.db');
// open the database
    Database database = await openDatabase(path, version: 1);
    // Insert some records in a transaction
    await database.transaction((txn) async {
      await txn.rawDelete('DELETE FROM score');
    });
  }

  void UpdateDB(int id, String dateTime, String nom, int score) async {
    // Open the database and store the reference.
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'highscore.db');
// open the database
    Database database = await openDatabase(path, version: 1);
    // Insert some records in a transaction
    await database.transaction((txn) async {
      await txn.rawUpdate(
          'UPDATE score SET datetime = "$dateTime", nom ="$nom", score = $score WHERE id = $id');
    });
  }
}
