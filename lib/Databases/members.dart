import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

class Members{

  @override
  Members({
    required this.profilePicture,
    required this.profileName,
    required this.profileRole,
    required this.xUrl
});

  final String profilePicture;
  final String profileName;
  final String profileRole;
  final String xUrl;

  static const membersTable = """
    CREATE TABLE IF NOT EXISTS members(
      profilePicture TEXT,
      profileName TEXT PRIMARY KEY,
      profileRole TEXT,
      xUrl TEXT
    );
  """;

  Map<String,dynamic> toMap(){
    return {
      "profilePicture" :  profilePicture,
      "profileName" :  profileName,
      "profileRole" :  profileRole,
      "xUrl" : xUrl
    };
  }

  factory Members.fromMap(Map<String,dynamic> map) => Members(profilePicture: map["profilePicture"], profileName: map["profileName"], profileRole: map["profileRole"], xUrl: map["xUrl"]);

  static createMembersTable() async {
    // A static method to create members tabler

    if (kIsWeb){
      var factory = databaseFactoryFfiWeb;
      var db = await factory.openDatabase("vl.db");
      db.transaction((txn) => txn.execute(membersTable));
    } else {
      var db = await openDatabase("vl.db");
      db.transaction((txn) => txn.execute(membersTable));
    }
  }

  static insertMemberIntoTable(Members member) async {
    // A static method to insert a member into members

    if (kIsWeb){
      var factory = databaseFactoryFfiWeb;
      var db = await factory.openDatabase("vl.db");
      db.insert("members", member.toMap());
    } else {
      var db = await openDatabase("vl.db");
      db.insert("members", member.toMap());
    }
  }

  static Future<List<Members>> retrieveExistingMembers() async {
    // A static method that retrieve a list of all members

    returnInstances(List<Map<String,dynamic>> rawMembers){
      List<Members> members  = [];

      for (Map<String,dynamic> member in rawMembers){
        members.add(Members.fromMap(member));
      }
      return members;
    }

    List<Map<String,dynamic>> rawMembers = [];
    List<Members> members = [];

    if (kIsWeb){
      var factory = databaseFactoryFfiWeb;
      var db = await factory.openDatabase("vl.db");
      rawMembers = await db.query("members");
    } else {
      var db = await openDatabase("vl.db");
      rawMembers = await db.query("members");
    }

    members = returnInstances(rawMembers);
    return members;

  }

}