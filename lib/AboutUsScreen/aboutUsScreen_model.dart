import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:voces_libres/exports.dart';

class AboutUsScreenModel extends HomeScreenModel implements Initialisable{

  List<Menus> menus = [];

  @override
  bool isMenuOpened = false;

  @override
  navigateToChoosedRoute(index, context);

  @override
  void initialise(){
    super.getCurrentMenuEntries();
  }

}