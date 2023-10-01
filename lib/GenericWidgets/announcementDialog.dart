import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../exports.dart';

class AnnouncementDialog extends StatelessWidget{

  @override
  AnnouncementDialog({
    required this.viewModel,
});

  final HomeScreenModel viewModel;


  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Stack(
        children: [
          // Floating Banner
          InkWell(
            onTap : (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => EventReaderView(eventTitle: viewModel.latestEventTitle, eventImage: viewModel.latestEventImage, eventLocation: viewModel.latestEventLocation, eventDate: viewModel.latestEventDate, eventHour: viewModel.latestEventHour, eventMembers: viewModel.latestEventMembers, eventText: viewModel.latestEventText, eventUbication: viewModel.latestEventUbication)));
            },
            child : Container(
              width: getDeviceWidth(context) * 0.9,
              height: getDeviceHeight(context) * 0.75,
              margin: EdgeInsets.only(
                top: getDeviceHeight(context) * 0.05,
                bottom: getDeviceHeight(context) * 0.2,
                left: getDeviceWidth(context) * 0.05,
                right: getDeviceWidth(context) * 0.05
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage(viewModel.latestEventImage),
                  fit: kIsWeb ? BoxFit.fitHeight : BoxFit.fill
                )
              ),
            ),
          ),

          // Close Button
          Container(
            width: getDeviceWidth(context) ,
            height: getDeviceHeight(context) * 0.15,
            margin: EdgeInsets.only(
              top: getDeviceHeight(context) * 0.85,
            ),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.65),
              borderRadius: BorderRadius.only(
              )
            ),
            child: IconButton(
              onPressed : (){
                viewModel.isEventDismissed = true;
                viewModel.notifyListeners();

              },
              icon : Icon(Icons.keyboard_arrow_up_rounded, color: Colors.white, size: 100, weight: 12,)),

          ),
        ],
      ),
    );
  }
}