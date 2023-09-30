import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

class Settings {

  @override
  const Settings({
    required this.name,
    required this.value,
});

  final String name;
  final String value;

  static const settingsTable = """
    CREATE TABLE IF NOT EXISTS settings(
      name TEXT PRIMARY KEY,
      value TEXT
    );""";

  Map<String,dynamic> toMap() => {"name" :  name, "value" : value};
  factory Settings.fromMap(Map<String,dynamic> map) => Settings(name: map["name"], value: map["value"]);

  static createSettingsTable() async {
    // A static method to create settings table

    if (kIsWeb){
      var factory = databaseFactoryFfiWeb;
      var db = await factory.openDatabase("vl.db");
      db.transaction((txn) => txn.execute(settingsTable));
    } else {
      var db = await openDatabase("vl.db");
      db.transaction((txn) => txn.execute(settingsTable));
    }
  }

  static insertSetting(Settings setting) async {
    // A static method to insert a user setting

    if (kIsWeb){
      var factory = databaseFactoryFfiWeb;
      var db = await factory.openDatabase("vl.db");
      db.insert("settings", setting.toMap());
    } else {
      var db = await openDatabase("vl.db");
      db.insert("settings", setting.toMap());
    }
  }

  static updateSetting(String name, String newValue) async {
    // Update the value of an existing setting

    if (kIsWeb){
      var factory = databaseFactoryFfiWeb;
      var db = await factory.openDatabase("vl.db");
      db.update("settings", {"name": name, "value": newValue}, where: "name = ?", whereArgs: [name]);
    } else {
      var db = await openDatabase("vl.db");
      db.update("settings", {"name": name, "value": newValue}, where: "name = ?", whereArgs: [name]);
    }
  }

  static Future<List<Settings>> retrieveExistingSettings() async {
    // A method that returns existing settings flags

    getSettingsInstances(List<Map<String,dynamic>> rawSettings){
      // Returns a list of settings instances
      List<Settings> settings = [];

      for (Map<String,dynamic> rawSetting in rawSettings){
        settings.add(Settings.fromMap(rawSetting));
      }

      return settings;
    }

    List<Map<String,dynamic>> rawSettings = [];
    List<Settings> settings = [];

    if (kIsWeb){
      var factory = databaseFactoryFfiWeb;
      var db = await factory.openDatabase("vl.db");
      rawSettings = await db.query("settings");
    } else {
      var db = await openDatabase("vl.db");
      rawSettings = await db.query("settings");
    }

    settings = getSettingsInstances(rawSettings);
    return settings;
  }

}