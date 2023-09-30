import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

class Menus{
  @override
  Menus({
    required this.name,
    required this.route,
    required this.hasChilds
});

  final String name;
  final String route;
  final String hasChilds;

  static const menusTable = """
    CREATE TABLE IF NOT EXISTS menus(
      name TEXT PRIMARY KEY,
      route TEXT,
      hasChilds TEXT
    );
  """;

   Map<String,dynamic> toMap(){
    return {
      "name" :  name,
      "route" :  route,
      "hasChilds" :  hasChilds
    };
  }

  factory Menus.fromMap(Map<String,dynamic> map) => Menus(
    name: map["name"],
    route: map["route"],
    hasChilds: map["hasChilds"]
  );

  static void createMenusTable() async {
    // A static method that creates the menus table

    if (kIsWeb){
      var factory = databaseFactoryFfiWeb;
      var db = await factory.openDatabase("vl.db");
      db.transaction((txn) => txn.execute(menusTable));
    } else {
      var db = await openDatabase("vl.db");
      db.transaction((txn) => txn.execute(menusTable));
    }
  }

  static void insertMenuIntoTable(Menus menu) async {
    // A method to add new menu entries

    if (kIsWeb){
      var factory = databaseFactoryFfiWeb;
      var db = await factory.openDatabase("vl.db");
      db.insert("menus", menu.toMap());
    } else {
      var db = await openDatabase("vl.db");
      db.insert("menus", menu.toMap());
    }
  }

  static Future<List<Menus>> retrieveExistingMenus() async  {
    // A static method to retrieve all existing menus inside the database


    convertToInstances(List<Map<String,dynamic>> rawMenus){
      // This method returns a list of menus ready to use
      List<Menus> menus = [];

      for (Map<String,dynamic> rawMenu in rawMenus){
        menus.add(Menus.fromMap(rawMenu));
      }

      return menus;
    }

    List<Map<String,dynamic>> rawMenus = [];
    List<Menus> menus = [];

    if (kIsWeb){
      var factory = databaseFactoryFfiWeb;
      var db = await factory.openDatabase("vl.db");
      rawMenus = await db.query("menus");
    } else {
      var db = await openDatabase("vl.db");
      rawMenus = await db.query("menus");
    }


    menus = convertToInstances(rawMenus);
    return menus;
}

}