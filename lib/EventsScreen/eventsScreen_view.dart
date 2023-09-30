import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../exports.dart';

class EventsScreenView extends StackedView<EventsScreenModel>{
  @override
  const EventsScreenView({super.key});

  @override
  Widget builder(
      BuildContext context,
      EventsScreenModel viewModel,
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
  EventsScreenModel viewModelBuilder(BuildContext context) => EventsScreenModel();
}