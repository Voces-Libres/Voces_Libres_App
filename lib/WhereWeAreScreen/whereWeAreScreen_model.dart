import 'package:stacked/stacked.dart';
import 'package:voces_libres/exports.dart';

class WhereWeAreScreenModel extends HomeScreenModel implements Initialisable{

  @override
  bool isMenuOpened = false;

  @override
  void initialise(){
    super.getCurrentMenuEntries();
  }
}