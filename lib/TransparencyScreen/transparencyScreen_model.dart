import 'package:stacked/stacked.dart';
import 'package:voces_libres/exports.dart';

class TransparencyScreenModel extends HomeScreenModel implements Initialisable{
  @override
  bool isMenuOpened = false;

  @override
  void initialise(){
    super.getCurrentMenuEntries();
  }
}