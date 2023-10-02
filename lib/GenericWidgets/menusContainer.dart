import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../exports.dart';

class MenusContainer extends StatelessWidget{
  @override
  MenusContainer({
    required this.viewModel,
    this.isEntryMenu = false,
    super.key});

  final viewModel;
  final bool isEntryMenu;

  @override
  Widget build(BuildContext context){
    return Container(
      width: getDeviceWidth(context) * 0.9,
      height: getDeviceHeight(context) * 0.4,
      margin: EdgeInsets.only(
        left: getDeviceWidth(context) * 0.05,
        right: getDeviceWidth(context) * 0.05,
        top: kIsWeb ? getDeviceHeight(context) * 0.3 : getDeviceHeight(context) * 0.25
      ),
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: isEntryMenu ? viewModel.menusEntries.length : viewModel.menus.length,
          itemBuilder: (BuildContext, index){
            return Container(
              margin: EdgeInsets.only(
                bottom: getDeviceHeight(context) * 0.015
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, style: BorderStyle.solid)
              ),
            child: TextButton(
            onPressed: (){
              viewModel.navigateToChoosedRoute(index, context);
              },
            child: Text(isEntryMenu ? viewModel.menusEntries[index].name : viewModel.menus[index].name, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 35), textAlign: TextAlign.center
              ,),
            ),
            );
          }
      )
    );
  }
}