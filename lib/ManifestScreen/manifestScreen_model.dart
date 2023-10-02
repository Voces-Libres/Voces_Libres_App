import 'package:stacked/stacked.dart';
import 'package:voces_libres/exports.dart';

class ManifestScreenModel extends HomeScreenModel implements Initialisable{

  @override
  bool isMenuOpened =  false;

  bool enterFullScreenViewer = false;

  @override
  void initialise(){
    super.getCurrentMenuEntries();
  }
}