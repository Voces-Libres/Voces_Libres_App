import '../exports.dart';

class MenusEntriesData {


  static Map<String, dynamic> menuEntriesMap = {

    "Quienes Somos": {
      "menu": "Sobre Nosotros",
      "route": "WhoWeAreScreen"
    },

    "Decálogo": {
      "menu": "Sobre Nosotros",
      "route": "DecalogueScreen"
    },

    "Nuestro Equipo": {
      "menu": "Sobre Nosotros",
      "route": "OurTeamScreen"
    },

    "Dónde Estamos": {
      "menu": "Sobre Nosotros",
      "route": "WhereWeAreScreen"
    },
    "Manifiestos Políticos": {
      "menu": "Documentos",
      "route": "ManifestScreen"
    },

    "Carteles": {
      "menu": "Documentos",
      "route": "PostersScreen"
    },

    "Transparencia": {
      "menu": "Documentos",
      "route": "TransparencyScreen"
    }
  };

  static insertEntriesIntoMenu() async {
    // A static method that insert entries inside a menu

    // To be executed once
    MenuEntries.createMenuEntriesTable();

    for (String entry in menuEntriesMap.keys) {
      MenuEntries.insertMenuEntry
        (MenuEntries(
          name: entry,
          menu: menuEntriesMap[entry]["menu"],
          route: menuEntriesMap[entry]["route"]));
    }
  }
}