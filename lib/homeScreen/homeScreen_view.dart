import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../exports.dart';

class HomeScreenView extends StackedView<HomeScreenModel>{
  @override
  const HomeScreenView({super.key});

  @override
  Widget builder(
      BuildContext context,
      HomeScreenModel viewModel,
      Widget? child
      ){

    return Scaffold(
      body: Stack(
        children: [
          // Background Color
          BackgroundTheme(backgroundColor: vl_green,),

          // App Bar
          GenericAppBar(viewModel: viewModel),

          // Menu
          // Show menu only if expanded
          if (viewModel.isMenuOpened)
          MenusContainer(viewModel: viewModel),

          // Footer
          FooterWidget(),

          // Announcement Dialog
          if (!viewModel.isEventDismissed)
          AnnouncementDialog(viewModel: viewModel,),
        ],
      ),
    );
  }

  @override
  HomeScreenModel viewModelBuilder(BuildContext context) => HomeScreenModel();
}