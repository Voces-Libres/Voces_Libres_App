import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:voces_libres/TransparencyScreen/transparencyScreen_model.dart';
import '../exports.dart';

class TransparencyScreenView extends StackedView<TransparencyScreenModel>{
  @override
  const TransparencyScreenView({super.key});

  @override
  Widget builder(
      BuildContext context,
      TransparencyScreenModel viewModel,
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
  TransparencyScreenModel viewModelBuilder(BuildContext context) => TransparencyScreenModel();
}