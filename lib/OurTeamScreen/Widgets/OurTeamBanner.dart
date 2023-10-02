import 'package:flutter/material.dart';
import '../../exports.dart';

class OurTeamBanner extends StatelessWidget{
  @override
  const OurTeamBanner({
    required this.viewModel,
    super.key});

  final OurTeamScreenModel viewModel;

  @override
  Widget build(BuildContext context){
    return Container(
      width: getDeviceWidth(context) * 0.8 ,
      height: getDeviceHeight(context) * 0.2,
      margin: EdgeInsets.only(
        left: getDeviceWidth(context) * 0.1,
        right: getDeviceWidth(context) * 0.1,
        top: viewModel.isMenuOpened ? getDeviceHeight(context) * 0.7 :  getDeviceHeight(context) * 0.25
      ),
      child: const Text("¡Conoce Nuestro Equipo!", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 35), textAlign: TextAlign.center,),
    );
  }
}