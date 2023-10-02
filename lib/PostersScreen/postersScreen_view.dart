import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:voces_libres/PostersScreen/postersScreen_model.dart';
import '../exports.dart';

class PostersScreenView extends StackedView<PostersScreenModel>{
  @override
  const PostersScreenView({super.key});

  @override
  Widget builder(
      BuildContext context,
      PostersScreenModel viewModel,
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
  PostersScreenModel viewModelBuilder(BuildContext context) => PostersScreenModel();
}