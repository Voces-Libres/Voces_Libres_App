import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'menusContainer.dart';
import '../exports.dart';
import 'package:flutter_html/flutter_html.dart';

class ArticleSheet extends StatelessWidget{
  @override
  const ArticleSheet({
    required this.viewModel,
    required this.eventTitle,
    required this.eventImage,
    required this.eventLocation,
    required this.eventDate,
    required this.eventHour,
    required this.eventMembers,
    required this.eventText,
    required this.eventUbication,
});

  final viewModel;
  final String eventTitle;
  final String eventImage;
  final String eventLocation;
  final String eventDate;
  final String eventHour;
  final String eventMembers;
  final String eventText;
  final String eventUbication;

  @override
  Widget build(BuildContext context){
    return Container(
      height: getDeviceHeight(context),
      width: getDeviceWidth(context),
      margin: EdgeInsets.only(
        top: getDeviceHeight(context) * 0.1,
      ),
      decoration: BoxDecoration(
        color: viewModel.getDarkModeState() ? Colors.black : Colors.white
      ),
      child: ListView(
            children: [
              // Article Title
              Container(
                width: getDeviceWidth(context) * 0.6,
                height: getDeviceHeight(context)  * 0.2,
                margin: EdgeInsets.only(
                  left: getDeviceWidth(context) * 0.2,
                  right: getDeviceWidth(context) * 0.2,
                  bottom: kIsWeb ? getDeviceHeight(context) * 0 : getDeviceHeight(context) * 0.02,
                ),
                child: Text(eventTitle, style: TextStyle(color: viewModel.getDarkModeState()? Colors.white : Colors.black, fontSize: getDeviceHeight(context) * 0.045, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
              ),

              // Article Details
              Container(
                width: getDeviceWidth(context) * 0.5 ,
                height: getDeviceHeight(context) * 0.2,
                margin: EdgeInsets.only(
                  left: getDeviceWidth(context) * 0.25,
                  right: getDeviceWidth(context) * 0.25
                ),
                child: Text("${eventDate}\n${eventHour}\n${eventLocation}", style: TextStyle(color: viewModel.getDarkModeState() ? Colors.white : Colors.black, fontSize: getDeviceHeight(context) * 0.025, fontWeight: FontWeight.bold),  textAlign: TextAlign.center,),
              ),

              // Article Hour


              // Article Image
              Container(
                width: getDeviceWidth(context) * 0.8 ,
                height: getDeviceHeight(context) * 0.6,
                margin: EdgeInsets.only(
                    left: getDeviceWidth(context) * 0.1,
                    right: getDeviceWidth(context) * 0.1,
                    top: getDeviceHeight(context) * 0.05,
                    bottom: getDeviceHeight(context) * 0.05
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                    image: AssetImage(eventImage),
                    fit: BoxFit.fitHeight
                  )
                ),
              ),

              // Article Text
              Container(
                width: getDeviceWidth(context) * 0.8 ,
                height: getDeviceHeight(context),
                margin: EdgeInsets.only(
                    left: getDeviceWidth(context) * 0.1,
                    right: getDeviceWidth(context) * 0.1,
                ),
                child :Text("$eventText\n\n\n\nIrtervienen :\n${eventMembers.replaceAll(",", "\n")}", style: TextStyle(color: viewModel.getDarkModeState() ? Colors.white : Colors.black, fontSize: 20, fontWeight: FontWeight.bold  ), textAlign: TextAlign.center,),
                  // Paste on Clipboard
              ),
            ],
          )
      );
  }
}