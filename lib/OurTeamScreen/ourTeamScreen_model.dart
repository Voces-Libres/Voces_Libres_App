import 'package:stacked/stacked.dart';
import 'package:voces_libres/Data/membersData.dart';
import 'package:voces_libres/exports.dart';

class OurTeamScreenModel extends HomeScreenModel implements Initialisable{

  List<Members> members = [];

  @override
  bool isMenuOpened = false;

  void getCurrentMembers() async {
    // This method returns existing members

    try {
      members = await Members.retrieveExistingMembers();
    } catch (e){
      MembersData.insertMembers();
      members = await Members.retrieveExistingMembers();
    }

    notifyListeners();
  }

  @override
  void initialise(){
    super.getCurrentMenuEntries();
    getCurrentMembers();
  }
}