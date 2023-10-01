import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../exports.dart';
import 'package:share_plus/share_plus.dart';

class ArticleAppBar extends StatelessWidget{
  @override
  const ArticleAppBar({
    required this.viewModel,
    required this.articleImage,
    required this.articleText,
    required this.articleTitle,
    required this.articleDate,
    required this.articleHour,
    required this.articleLocation,
    required this.articleMembers,
    super.key});

  final viewModel;
  final String articleImage;
  final String articleTitle;
  final String articleText;
  final String articleDate;
  final String articleHour;
  final String articleLocation;
  final String articleMembers;

  @override
  Widget build(BuildContext context){
    return Container(
      width: getDeviceWidth(context) ,
      height: getDeviceHeight(context) * 0.15,
      margin: EdgeInsets.only(
        bottom: getDeviceHeight(context) * 0.85
      ),
      decoration: BoxDecoration(
        color: viewModel.getDarkModeState() ? Colors.black : Colors.white
      ),
      child: Row(
        children: [
          // Dar/Mode Turner
          Container(
            width: getDeviceWidth(context) * 0.15,
            height: getDeviceHeight(context) * 0.15,
            margin: EdgeInsets.only(
              left: getDeviceWidth(context) * 0.025,
              right: getDeviceWidth(context) * 0.65
            ),
            child: IconButton(
              onPressed: (){
                viewModel.getDarkModeState() ?  viewModel.isDarkModeEnabled = false :  viewModel.isDarkModeEnabled = true;
                viewModel.notifyListeners();
              },
              icon: Icon(viewModel.getDarkModeState() ?  Icons.wb_sunny_rounded : Icons.dark_mode_rounded, color: viewModel.getDarkModeState() ?  Colors.white :  Colors.black, size: 25, ),
            ),
          ),

          // Export Article
          Container(
            width: getDeviceWidth(context) * 0.15,
            height: getDeviceHeight(context) * 0.15,
            child: IconButton(
              onPressed: () async {
                final data = await rootBundle.load(articleImage);
                final buffer = data.buffer;
                final share = await Share.shareXFiles(
                    [XFile.fromData(buffer.asUint8List(data.offsetInBytes, data.lengthInBytes), name: "evento_1.jpg", mimeType: "jpg" ),], subject: articleTitle, text: "${articleTitle}\n\n${articleDate}\n${articleHour}\n${articleLocation}\n\n${articleText}\n\n\n\nIntervienen : \n\n${articleMembers.replaceAll(",", "\n")}");
              },
              icon: Icon(Icons.share_rounded, color: viewModel.getDarkModeState() ? Colors.white : Colors.black),
            ),
          )

        ],
      ),
    );
  }
}