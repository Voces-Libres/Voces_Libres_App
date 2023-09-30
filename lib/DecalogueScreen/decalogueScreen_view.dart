import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:voces_libres/DecalogueScreen/decalogueScreen_model.dart';
import '../exports.dart';

class DecalogueScreenView extends StackedView<DecalogueScreenModel>{
  @override
  const DecalogueScreenView({super.key});

  @override
  Widget builder(
      BuildContext context,
      DecalogueScreenModel viewModel,
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
  DecalogueScreenModel viewModelBuilder(BuildContext context) => DecalogueScreenModel();
}