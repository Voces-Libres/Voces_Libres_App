import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../exports.dart';

class WhoWeAreScreenView extends StackedView<WhoWeAreScreenModel>{
  @override
  const WhoWeAreScreenView({super.key});

  @override
  Widget builder(
      BuildContext context,
      WhoWeAreScreenModel viewModel,
      Widget? child
      ){
    return Scaffold(
      body: Stack(
        children: [

        ],
      ),
    );
  }

  @override
  WhoWeAreScreenModel viewModelBuilder(BuildContext context) => WhoWeAreScreenModel();


}