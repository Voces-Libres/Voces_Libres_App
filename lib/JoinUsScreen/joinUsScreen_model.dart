import 'package:stacked/stacked.dart';
import 'package:voces_libres/exports.dart';

class JoinUsScreenModel extends HomeScreenModel implements Initialisable{

  @override
  bool isMenuOpened = false;

  @override
  navigateToChoosedRoute(index, context);

  @override
  void initialise(){
    super.getCurrentMenuEntries();

  }
}