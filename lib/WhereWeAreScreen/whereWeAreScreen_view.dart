import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../exports.dart';

class WhereWeAreScreenView extends StackedView<WhereWeAreScreenModel>{
  @override
  const WhereWeAreScreenView({super.key});

  @override
  Widget builder(
      BuildContext context,
      WhereWeAreScreenModel viewModel,
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
  WhereWeAreScreenModel viewModelBuilder(BuildContext context) => WhereWeAreScreenModel();
}