import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import '../exports.dart';

class DocumentsScreenView extends StackedView<DocumentsScreenModel>{
  @override
  const DocumentsScreenView({super.key});

  @override
  Widget builder(
      BuildContext context,
      DocumentsScreenModel viewModel,
      Widget? child,
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
      MenusContainer(viewModel: viewModel, isEntryMenu: true,),

      // Generic Footer
      FooterWidget(),

    ],
    ),
  );
}

@override
  DocumentsScreenModel viewModelBuilder(BuildContext context) => DocumentsScreenModel();
}