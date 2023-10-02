import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:voces_libres/ManifestScreen/manifestScreen_model.dart';
import 'package:voces_libres/exports.dart';
import '../../exports.dart';

class ManifestViewer extends StatelessWidget{
  @override
  const ManifestViewer({
    required this.viewModel,
    super.key});

  final ManifestScreenModel viewModel;

  @override
  Widget build(BuildContext context){
    return Container(
          width: kIsWeb && getDeviceWidth(context) > 400  && !viewModel.enterFullScreenViewer? getDeviceWidth(context) * 0.2 : getDeviceWidth(context),
          height: kIsWeb && getDeviceWidth(context) > 400 && !viewModel.enterFullScreenViewer ?  getDeviceHeight(context) * 0.7 : getDeviceHeight(context),
          margin: EdgeInsets.only(
              top: kIsWeb && getDeviceWidth(context) > 400 && !viewModel.enterFullScreenViewer ? getDeviceHeight(context) * 0.3 : getDeviceHeight(context) * 0,
              bottom: kIsWeb && getDeviceWidth(context) > 400 && !viewModel.enterFullScreenViewer ? getDeviceHeight(context) * 0.1 : getDeviceHeight(context) * 0,
              left: kIsWeb && getDeviceWidth(context) > 400 && !viewModel.enterFullScreenViewer ? getDeviceWidth(context) * 0.4 : getDeviceWidth(context) * 0,
              right: kIsWeb && getDeviceWidth(context) > 400 && !viewModel.enterFullScreenViewer ? getDeviceWidth(context) * 0.4 : getDeviceWidth(context) * 0
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10)
          ),
          child: InkWell(
            onTap : (){
              if (kIsWeb && getDeviceWidth(context) > 400){
                viewModel.enterFullScreenViewer ? viewModel.enterFullScreenViewer = false :  viewModel.enterFullScreenViewer = true;
                viewModel.notifyListeners();
              }

            },
            child :  SfPdfViewer.asset(
              "assets/manifest/manifiesto.pdf",
              enableTextSelection: true,
              canShowScrollStatus: true,
              canShowPageLoadingIndicator: true,
              canShowPaginationDialog: true,
              enableDoubleTapZooming: true,
          ),
        ),
    );
  }
}