import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:voces_libres/OurTeamScreen/Widgets/OurTeamBanner.dart';
import 'package:voces_libres/OurTeamScreen/Widgets/OurTeamMembers.dart';
import '../exports.dart';

class OurTeamScreenView extends StackedView<OurTeamScreenModel>{
  @override
  const OurTeamScreenView({super.key});

  @override
  Widget builder(
      BuildContext context,
      OurTeamScreenModel viewModel,
      Widget? child
      ){
    return Scaffold(
      body: Stack(
        children: [
          // Generic Background Theme
          BackgroundTheme(backgroundColor: vl_green,),

          ListView(
              children: [
                // Generic Menu
                if(viewModel.getMenuState())
                  MenusContainer(viewModel: viewModel),

                // Members Banner
                OurTeamBanner(viewModel: viewModel),

                // Members
                OurTeamMembers(viewModel: viewModel),

              ],
          ),

          // Generic App Bar
          GenericAppBar(viewModel: viewModel),


          // Generic Footer
         // FooterWidget(),
        ],
      ),
    );
  }

  @override
  OurTeamScreenModel viewModelBuilder(BuildContext context) => OurTeamScreenModel();
}