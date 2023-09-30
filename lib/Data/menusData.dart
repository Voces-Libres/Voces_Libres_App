import '../exports.dart';

class MenusData {
  // This class is used to add new menu entries to menu table

  static Map<String, dynamic> menusMap = {
    "Inicio": {
      "route": "HomeScreen",
      "hasChilds": "false",
    },

    "Sobre Nosotros": {
      "route": "AboutUsScreen",
      "hasChilds": "true"
    },

    "Documentos": {
      "route": "DocumentsScreen",
      "hasChilds": "true"
    },

    "Eventos": {
      "route": "EventsScreen",
      "hasChilds": "false"
    },

    "Blog": {
      "route": "BlogScreen",
      "hasChilds": "false"
    },

    "Hazte Socio": {
      "route": "JoinUsScreen",
      "hasChilds": "false"
    },

    "Donaciones": {
      "route": "ContributeScreen",
      "hasChilds": "false"
    },

    "Contacto": {
      "route": "ContactScreen",
      "hasChilds": "false"
    }
  };

  static insertMenusEntries() async {
    // This method inserts menus entries if needed

    // To be executed once
    Menus.createMenusTable();

    for (String menu in menusMap.keys){
      Menus.insertMenuIntoTable(Menus(name: menu, route: menusMap[menu]["route"], hasChilds: menusMap[menu]["hasChilds"]));
    }
  }


}