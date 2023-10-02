import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'manifestScreen_model.dart';
import 'package:stacked/stacked.dart';
import '../exports.dart';

class ManifestScreenView extends StackedView<ManifestScreenModel>{
  @override
  const ManifestScreenView({super.key});

  @override
  Widget builder(
      BuildContext context,
      ManifestScreenModel viewModel,
      Widget? child
      ){
    return Scaffold(
      body : Stack(
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
      )
    );
  }
  @override
  ManifestScreenModel viewModelBuilder(BuildContext context) => ManifestScreenModel();
}