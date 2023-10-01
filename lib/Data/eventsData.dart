import '../exports.dart';

class EventsData{


  static Map<String,dynamic> eventsMap = {
    "Acto Presentación Voces Libres" : {
      "image" :  "assets/eventos/evento_1.jpg",
      "text" : "Estas invitado al acto de presentación de Voces Libres\nQue será celebrado el 9 de octubre a las 12:00 en el Aula Magna de la UC3M (Campus de Getafe).\n\n¿Te lo vas a  perder? ",
      "year" : "2023",
      "month" :  "10",
      "day" : "9",
      "ubication" :  "",
      "hour" :  "12:00",
      "members" : "Juan Casillas Bayo, Malena Contestí, Miguel Garrido",
      "location" :  "Aula Magna\nUC3M\n(Campus Getafe)"
    }
  };

  static insertNewEvents() async {
    // A static method to insert new events into events table

    // To be executed once
    Events.createEventsTable();

    for (String event in eventsMap.keys){
      Events.insertEvents(Events(name: event, year: eventsMap[event]["year"], month: eventsMap[event]["month"], day: eventsMap[event]["day"], image: eventsMap[event]["image"], text: eventsMap[event]["text"], ubication: eventsMap[event]["ubication"], hour: eventsMap[event]["hour"], members: eventsMap[event]["members"], location: eventsMap[event]["location"]));
    }
  }

}