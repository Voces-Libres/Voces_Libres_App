import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

class Events{

  @override
  const Events({
    required this.name,
    required this.year,
    required this.month,
    required this.day,
    required this.image,
    required this.text,
    required this.ubication
});

  final String name;
  final String year;
  final String month;
  final String day;
  final String image;
  final String text;
  final String ubication;

  static const eventsTable = """
    CREATE TABLE IF NOT EXISTS events(
      name TEXT PRIMARY KEY,
      year TEXT,
      month TEXT,
      day TEXT,
      image TEXT,
      text TEXT,
      ubication TEXT
    );
  """;

  Map<String,dynamic> toMap() => {"name" :  name, "year" :  year, "month" :  month, "day" :  day, "image" :  image, "text" :  text, "ubication" :  ubication};
  factory Events.fromMap(Map<String,dynamic> map) => Events(name: map["name"], year: map["year"], month: map["month"], day: map["day"], image: map["image"], text: map["text"], ubication: map["ubication"]);


  static createEventsTable() async {
    // A static method to create events table

    if (kIsWeb){
      var factory = databaseFactoryFfiWeb;
      var db = await factory.openDatabase("vl.db");
      db.transaction((txn) => txn.execute(eventsTable));
    } else {
      var db = await openDatabase("vl.db");
      db.transaction((txn) => txn.execute(eventsTable));
    }
  }

  static insertEvents(Events event) async {
    // A static method to insert new events into events table

    if (kIsWeb){
      var factory = databaseFactoryFfiWeb;
      var db = await factory.openDatabase("vl.db");
      db.insert("events", event.toMap());
    } else {
      var db = await openDatabase("vl.db");
      db.insert("events", event.toMap());
    }
  }

  static Future<List<Events>> retrieveExistingEvents() async {
    // A static method that retrieve all existing events in db

    eventToInstance(List<Map<String,dynamic>> rawEvents){
      // A method that returns a full list of events
      List<Events> events = [];

      for (Map<String,dynamic> rawEvent in rawEvents){
        events.add(Events.fromMap(rawEvent));
      }

      return events;
    }

    List<Map<String,dynamic>> rawEvents = [];
    List<Events> events = [];

    if (kIsWeb){
      var factory = databaseFactoryFfiWeb;
      var db = await factory.openDatabase("vl.db");
      rawEvents = await db.query("events");
    } else {
      var db = await openDatabase("vl.db");
      rawEvents = await db.query("events");
    }

    events = eventToInstance(rawEvents);
    return events;

  }

}