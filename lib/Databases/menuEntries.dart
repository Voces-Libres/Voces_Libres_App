import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

class MenuEntries{
  @override
  MenuEntries({
    required this.name,
    required this.menu,
    required this.route
});

  final String name;
  final String menu;
  final String route;

  static const menuEntriesTable = """
    CREATE TABLE IF NOT EXISTS menuEntries(
      name TEXT PRIMARY KEY,
      menu TEXT,
      route TEXT,
      FOREIGN KEY(menu) REFERENCES menus(name)
    );
  """;

  Map<String,dynamic> toMap(){
    return {
      "name" :  name,
      "menu" : menu,
      "route" : route
    };
  }

  factory MenuEntries.fromMap(Map<String,dynamic> map ) => MenuEntries(
      name: map["name"],
      menu: map["menu"],
      route: map["route"]);

  static void createMenuEntriesTable() async {
    // A static method to create menu entries table

    if (kIsWeb){
      var factory = databaseFactoryFfiWeb;
      var db = await factory.openDatabase("vl.db");
      db.transaction((txn) => txn.execute(menuEntriesTable));
    } else {
      var db = await openDatabase("vl.db");
      db.transaction((txn) => txn.execute(menuEntriesTable));
    }
  }

  static void insertMenuEntry(MenuEntries menuEntry) async {
    // A static method to insert a menu entry inside a menu

    if (kIsWeb){
      var factory = databaseFactoryFfiWeb;
      var db = await factory.openDatabase("vl.db");
      db.insert("menuEntries", menuEntry.toMap());
    } else {
      var db = await openDatabase("vl.db");
      db.insert("menuEntries", menuEntry.toMap());
    }
  }

  static Future<List<MenuEntries>> retrieveMenuEntries(String menu) async {
    // A static method to return an entry from a given menu key

    entriesToInstances(List<Map<String,dynamic>> rawMenuEntries){
      // A method that receives a list of maps plenty of menu entries and returns a list of menu entries instances
      List<MenuEntries> menuEntries = [];

      for (Map<String,dynamic> rawMenuEntry in rawMenuEntries){
        menuEntries.add(MenuEntries.fromMap(rawMenuEntry));
      }
      return menuEntries;
    }

    List<Map<String,dynamic>> rawMenuEntries = [];
    List<MenuEntries> menuEntries = [];

    if (kIsWeb){
      var factory = databaseFactoryFfiWeb;
      var db = await factory.openDatabase("vl.db");
      rawMenuEntries = await db.query("menuEntries", where: "menu = ?", whereArgs: [menu]);
    } else {
      var db = await openDatabase("vl.db");
      rawMenuEntries = await db.query("menuEntries", where: "menu = ?", whereArgs: [menu]);
    }

    menuEntries = entriesToInstances(rawMenuEntries);
    return menuEntries;

  }


}