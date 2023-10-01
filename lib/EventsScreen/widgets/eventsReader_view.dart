import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../exports.dart';

class EventReaderView extends StackedView<EventReaderModel>{
  @override
  EventReaderView({
    required this.eventTitle,
    required this.eventImage,
    required this.eventLocation,
    required this.eventDate,
    required this.eventHour,
    required this.eventMembers,
    required this.eventText,
    required this.eventUbication,
    super.key});

  final String eventTitle;
  final String eventImage;
  final String eventLocation;
  final String eventDate;
  final String eventHour;
  final String eventMembers;
  final String eventText;
  final String eventUbication;

  @override
  Widget builder(
      BuildContext context,
      EventReaderModel viewModel,
      Widget? child
      ){
    return Scaffold(
      body: Stack(
        children: [
          // Generic App Bar
          ArticleAppBar(viewModel: viewModel, articleImage: eventImage, articleTitle:  eventTitle, articleText: eventText, articleDate: eventDate, articleHour: eventHour, articleLocation:  eventLocation, articleMembers: eventMembers,),

          // Generic Sheet
          ArticleSheet(viewModel: viewModel, eventTitle: eventTitle, eventImage: eventImage, eventLocation: eventLocation, eventDate: eventDate, eventHour: eventHour, eventMembers: eventMembers, eventText: eventText, eventUbication: eventUbication)

        ],
      ),
    );
  }

  @override
  EventReaderModel viewModelBuilder(BuildContext context) => EventReaderModel();


}