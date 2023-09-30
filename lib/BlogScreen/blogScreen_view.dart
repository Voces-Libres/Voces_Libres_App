import 'package:stacked/stacked.dart';
import '../exports.dart';
import 'package:flutter/material.dart';

class BlogScreenView extends StackedView<BlogScreenModel>{
  @override
  const BlogScreenView({super.key});

  @override
  Widget builder(
      BuildContext context,
      BlogScreenModel viewModel,
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
  BlogScreenModel viewModelBuilder(BuildContext context) => BlogScreenModel();
}