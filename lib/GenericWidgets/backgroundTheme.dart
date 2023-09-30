import 'package:flutter/material.dart';
import '../exports.dart';

class BackgroundTheme extends StatelessWidget{
  @override
  BackgroundTheme({this.backgroundColor = Colors.white, super.key});

  Color backgroundColor;

  @override
  Widget build(BuildContext context){
    return Container(
      height: getDeviceHeight(context),
      width: getDeviceWidth(context),
      decoration: BoxDecoration(
        color: backgroundColor
      ),
    );
  }
}