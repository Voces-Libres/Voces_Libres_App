import 'package:stacked/stacked.dart';
import '../exports.dart';
import 'package:flutter/material.dart';

class ContactScreenView extends StackedView<ContactScreenModel>{
  @override
  const ContactScreenView({super.key});

  @override
  Widget builder(
      BuildContext context,
      ContactScreenModel viewModel,
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
  ContactScreenModel viewModelBuilder(BuildContext context) => ContactScreenModel();
}