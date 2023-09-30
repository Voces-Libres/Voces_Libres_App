import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../exports.dart';

class OurTeamScreenView extends StackedView<OurTeamScreenModel>{
  @override
  const OurTeamScreenView({super.key});

  @override
  Widget builder(
      BuildContext context,
      OurTeamScreenModel viewModel,
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
  OurTeamScreenModel viewModelBuilder(BuildContext context) => OurTeamScreenModel();
}