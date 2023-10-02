import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
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
          // Generic Background
          if (kIsWeb && getDeviceWidth(context) > 400)
            BackgroundTheme(backgroundColor: vl_green,),

          // Generic App Bar
          if (kIsWeb && getDeviceWidth(context) > 400)
            GenericAppBar(viewModel: viewModel),

          // Generic Menu
          if(viewModel.getMenuState() && kIsWeb && getDeviceWidth(context) > 400)
            MenusContainer(viewModel: viewModel),

          // Manifest PDF Viewer
          if (!viewModel.getMenuState())
          ManifestViewer(viewModel: viewModel),

          // Generic Footer
          //FooterWidget(),
        ],
      )
    );
  }
  @override
  ManifestScreenModel viewModelBuilder(BuildContext context) => ManifestScreenModel();
}