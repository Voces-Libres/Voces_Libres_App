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
          // Generic Background Theme
          BackgroundTheme(backgroundColor: vl_green,),

          // Generic App Bar
          GenericAppBar(viewModel: viewModel),

          // Generic Menu
          if(viewModel.getMenuState())
            MenusContainer(viewModel: viewModel),

          // Generic Footer
          FooterWidget(),
        ],
      ),
    );
  }

  @override
  DecalogueScreenModel viewModelBuilder(BuildContext context) => DecalogueScreenModel();
}