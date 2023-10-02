import '../exports.dart';

class MembersData{

  static Map<String,dynamic> membersMap = {

    "Hugo Pérez Ayán" :  {
      "profilePicture" : "assets/members/hugo_ayan.jpg",
      "profileRole" :  "Presidente Voces Libres",
      "xUrl" : "https://x.com/hp_ayan"
    },

    "Jon Echevarria" :  {
      "profilePicture" : "assets/members/jon_echevarria.jpg",
      "profileRole" :  "Secretario General",
      "xUrl" : "https://x.com/Jon_Echeverria_"
    },

    "Álvaro Galván" :  {
      "profilePicture" : "assets/members/alvaro_galvan.jpg",
      "profileRole" :  "Responsable de Comunicación",
      "xUrl" : "https://x.com/AlvaroGalvanSt"
    },

    "Julia Palma" :  {
      "profilePicture" : "assets/members/julia_palma.jpg",
      "profileRole" :  "Responsable Relaciones Institucionales",
      "xUrl" : "https://x.com/juuliapalmaa"
    },

    "Manuel Arbona" :  {
      "profilePicture" : "assets/members/manuel_arbona.jpg",
      "profileRole" :  "Responsable Acción Política",
      "xUrl" : "https://twitter.com/ArbonaManu"
    },
  };

  static insertMembers() async {
    // A static method to insert new members

    // To be executed once
    Members.createMembersTable();

    for (String member in membersMap.keys){
      Members.insertMemberIntoTable(Members(profilePicture: membersMap[member]["profilePicture"], profileName:  member, profileRole:  membersMap[member]["profileRole"], xUrl:  membersMap[member]["xUrl"]));
    }
  }


}