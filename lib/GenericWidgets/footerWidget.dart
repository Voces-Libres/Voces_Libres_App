import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../exports.dart';

class FooterWidget extends StatelessWidget{
  @override
  FooterWidget({
    super.key});



  @override
  Widget build(BuildContext context){

    return Container(
      width: getDeviceWidth(context),
      height: kIsWeb ?  getDeviceHeight(context) * 0.35 : getDeviceHeight(context) * 0.3,
      margin: EdgeInsets.only(
        top: kIsWeb ? getDeviceHeight(context) * 0.65  : getDeviceHeight(context) * 0.7
      ),
      decoration:const  BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/banner/footer.png"),
          fit: BoxFit.fill
        )
      ),
    );
  }


}