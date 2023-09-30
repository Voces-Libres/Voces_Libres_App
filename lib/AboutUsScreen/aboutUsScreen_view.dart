import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:voces_libres/AboutUsScreen/aboutUsScreen_model.dart';
import 'package:voces_libres/exports.dart';

class AboutUsScreenView extends StackedView<AboutUsScreenModel>{
  @override
  const AboutUsScreenView({
    super.key});

  @override
  Widget builder(
      BuildContext context,
      AboutUsScreenModel viewModel,
      Widget? child
      ){
    return Scaffold(
      body : Stack(
        children: [
          // Background theme
          BackgroundTheme(backgroundColor: vl_green),

          // Generic App Bar
          GenericAppBar(viewModel: viewModel),

          // Generic Menu
          if (viewModel.getMenuState())
          MenusContainer(viewModel: viewModel),

          // Footer
          FooterWidget(),

        ],
      )
    );
  }
  @override
  AboutUsScreenModel viewModelBuilder(BuildContext context) => AboutUsScreenModel();
}