import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:voces_libres/exports.dart';

class DocumentsScreenModel extends HomeScreenModel implements Initialisable{

  @override
  bool isMenuOpened = true;

  @override
  navigateToChoosedRoute(index, context){
    Navigator.of(context).pushNamed(menusEntries[index].route);
  }


  @override
  void initialise(){
    super.getMenuEntries("Documentos");
  }
}