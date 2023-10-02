import '../exports.dart';

class MembersData{

  static Map<String,dynamic> membersMap = {
    "Álvaro Galván" :  {
      "profilePicture" : "assets/members/alvaro_galvan.jpg",
      "profileRole" :  "Responsable de Comunicación",
      "xUrl" : "https://x.com/AlvaroGalvanSt"
    },

    "Hugo Ayan" :  {
      "profilePicture" : "assets/members/hugo_ayan.jpg",
      "profileRole" :  "Presidente",
      "xUrl" : "https://x.com/hp_ayan"
    },

    "Jon Echevarria" :  {
      "profilePicture" : "assets/members/jon_echevarria.jpg",
      "profileRole" :  "Secretario",
      "xUrl" : "https://x.com/Jon_Echeverria_"
    },

    "Julia Palma" :  {
      "profilePicture" : "assets/members/julia_palma.jpg",
      "profileRole" :  "Fundadora Voces Libres",
      "xUrl" : "https://x.com/Jon_Echeverria_"
    },

    "Manuel Arbona" :  {
      "profilePicture" : "assets/members/manuel_arbona.jpg",
      "profileRole" :  "Fundador Voces Libres",
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