import '../exports.dart';

class EventsData{


  static Map<String,dynamic> eventsMap = {
    "Acto 9 Ocubre" : {
      "image" :  "assets/eventos/evento_1.jpg",
      "text" : "",
      "year" : "2023",
      "month" :  "10",
      "day" : "9",
      "ubication" :  ""
    }
  };

  static insertNewEvents() async {
    // A static method to insert new events into events table

    // To be executed once
    Events.createEventsTable();

    for (String event in eventsMap.keys){
      Events.insertEvents(Events(name: event, year: eventsMap[event]["year"], month: eventsMap[event]["month"], day: eventsMap[event]["day"], image: eventsMap[event]["image"], text: eventsMap[event]["text"], ubication: eventsMap[event]["ubication"]));
    }
  }

}