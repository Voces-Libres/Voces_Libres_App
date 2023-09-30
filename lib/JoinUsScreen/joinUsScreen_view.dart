import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import '../exports.dart';

class JoinUsScreenView extends StackedView<JoinUsScreenModel>{
  @override
  const JoinUsScreenView({super.key});

  @override
  Widget builder(
      BuildContext context,
      JoinUsScreenModel viewModel,
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
  JoinUsScreenModel viewModelBuilder(BuildContext context) => JoinUsScreenModel();
}