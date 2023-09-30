import '../exports.dart';

class MenusEntriesData{


  static Map<String,dynamic> menuEntriesMap = {

    "Quienes Somos" : {
      "menu" : "Sobre Nosotros",
      "route" : "WhoWeAreScreen"
    },

    "Decálogo" : {
      "menu" : "Sobre Nosotros",
      "route" : "DecalogueScreen"
    },

    "Nuestro Equipo" : {
      "menu" : "Sobre Nosotros",
      "route" : "OurTeamScreen"
    },

    "Dónde Estamos" : {
      "menu" : "Sobre Nosotros",
      "route" : "WhereWeAreScreen"
    }
  };

  static insertEntriesIntoMenu() async{
    // A static method that insert entries inside a menu

    for (String entry in menuEntriesMap.keys){
      try{
        MenuEntries.insertMenuEntry
          (MenuEntries(
            name: entry,
            menu: menuEntriesMap[entry]["menu"],
            route: menuEntriesMap[entry]["route"]));
      } catch (e){
        // Entries table doesn't exist!
        MenuEntries.createMenuEntriesTable();
        MenuEntries.insertMenuEntry
          (MenuEntries(
            name: entry,
            menu: menuEntriesMap[entry]["menu"],
            route: menuEntriesMap[entry]["route"]));
      }
    }
  }
}