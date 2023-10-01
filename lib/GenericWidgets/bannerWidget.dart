import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../exports.dart';

class BannerWidget extends StatelessWidget{
  @override
  const BannerWidget({
    required this.viewModel,
    super.key,
});

  final dynamic viewModel;

  @override
  Widget build(BuildContext context){
    return InkWell(
      onTap : (){
        viewModel.isLogoPressed ? viewModel.isLogoPressed = false :  viewModel.isLogoPressed = true;
        viewModel.notifyListeners();
      },
        child : Container(
          width: getDeviceWidth(context) * 0.3,
          height: getDeviceHeight(context) * 0.3,
          margin: EdgeInsets.only(
            top: getDeviceHeight(context) * 0.02,
            left: getDeviceWidth(context) * 0.02,
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(viewModel.isLogoPressed? viewModel.logoUri = "assets/logos/vlight.png" :  viewModel.logoUri = "assets/logos/vdark.png"
              ), fit: kIsWeb && getDeviceWidth(context) > 400 ?  BoxFit.fitHeight :  BoxFit.fitWidth,
            ),
            borderRadius: BorderRadius.circular(23),
          ),
        ),
    );
  }
}