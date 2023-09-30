import 'package:flutter/material.dart';
import '../exports.dart';

class GenericAppBar extends StatelessWidget {
  @override
  const GenericAppBar({
    required this.viewModel,
    super.key
});

  final dynamic viewModel;

  @override
  Widget build(BuildContext context){
    return Container(
      height: getDeviceHeight(context) * 0.3,
      width: getDeviceWidth(context) ,
      margin: EdgeInsets.only(
        bottom: getDeviceHeight(context) * 0.7,
        top: getDeviceHeight(context) * 0.02
      ),
      child: Row(
        children: [
          // Dark/Light mode turner
          Container(
            height: getDeviceHeight(context) * 0.3,
            width: getDeviceWidth(context) * 0.3,
            child: BannerWidget(viewModel: viewModel,)),

          // Menu Icon Button
          Container(
            height: getDeviceHeight(context) * 0.3,
            width: getDeviceWidth(context) * 0.3,
            margin: EdgeInsets.only(
              left: getDeviceWidth(context) * 0.4
            ),
            child: IconButton(
              style: IconButton.styleFrom(
              ),
              icon: Icon(Icons.menu_rounded, size: 55, color: viewModel.isMenuOpened ? Colors.black.withOpacity(0.5) : Colors.white),

              onPressed: () {
                viewModel.isMenuOpened ?  viewModel.isMenuOpened = false : viewModel.isMenuOpened = true;
                viewModel.notifyListeners();
                // TO-DO
              },
            ),
          ),
        ],
      ),

    );
  }

}