import 'dart:math';

import 'package:quiver/async.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:voces_libres/Data/eventsData.dart';
import 'package:voces_libres/Data/menusData.dart';
import '../exports.dart';
import 'package:quiver/time.dart';

class HomeScreenModel extends BaseViewModel implements Initialisable{

  String logoUri = "assets/logos/vdark.png";
  bool defaultLogo = true;
  List<Menus> menus = [];
  List<Events> events  = [];
  Color colorTheme = Colors.white;
  bool isDarkModeEnabled = true;
  bool isLogoPressed =  false;
  bool isMenuOpened = false;
  bool isModelReady = false;
  bool isEventDismissed = true;
  bool isClipBoardUsed = false;
  List<Events> currentEvents = [];
  String latestEventTitle = "";
  String latestEventImage = "";
  String latestEventDate = "";
  String latestEventText = "";
  String latestEventUbication =  "";
  String latestEventHour = "";
  String latestEventMembers = "";
  String latestEventLocation = "";

  @override
  void initialise(){
    getCurrentMenuEntries();
    getCurrentEvents();
    isModelReady = true;
    notifyListeners();
  }

  void setMenuState(bool state){
    isMenuOpened = state;
    notifyListeners();
  }

  void setClipboardState(bool state){
    isClipBoardUsed = state;
    notifyListeners();
  }

  bool getDarkModeState(){
    return isDarkModeEnabled;
  }

  bool getClipboardState(){
    return isClipBoardUsed;
  }

  bool getMenuState(){
    return isMenuOpened;
  }

  void getCurrentEvents() async {

    try {
      events = await Events.retrieveExistingEvents();
      notifyListeners();
    } catch (e){
      EventsData.insertNewEvents();
      events = await Events.retrieveExistingEvents();
      notifyListeners();
    }

    if (events.length != EventsData.eventsMap.keys.length){
      // We're missing some events!
      events = [];
      notifyListeners();

      EventsData.insertNewEvents();
      events = await Events.retrieveExistingEvents();
      notifyListeners();
    }

    print(events);
    getLatestEvent();

  }

  fetchLatestEventInfo(Events event){
    // Fetch latest event info from an instance
    latestEventTitle = event.name;
    latestEventImage = event.image;
    latestEventText = event.text;
    latestEventDate = "${event.day}/${event.month}/${event.year}";
    latestEventUbication = event.ubication;
    latestEventHour = "${event.hour}h";
    latestEventMembers = event.members;
    latestEventLocation =  event.location;

    notifyListeners();
  }

  getLatestEvent(){
    // This method gets latest event based on current day and month
    Random randomEvent = Random();
    var randomEventIndex;
   var currentDay = DateTime.now().day;
   var currentMonth = DateTime.now().month;
   late Events latestEvent;

    for (Events event in events){
      if (event.month == currentMonth && int.parse(event.day) >= currentDay || int.parse(event.month) > currentMonth){
          currentEvents.add(event);
          notifyListeners();
      }
    }

    if (currentEvents.length > 1){
      randomEventIndex = randomEvent.nextInt(currentEvents.length);
      latestEvent = events[randomEventIndex];
    } else {
      latestEvent = events[0];
    }

    fetchLatestEventInfo(latestEvent);

    isEventDismissed = false;
    notifyListeners();
  }

  void navigateToChoosedRoute(int index, BuildContext context) async {
    // This method allow us to navigate to the user selected option
    Navigator.of(context).pushNamed(menus[index].route);
}

  void changeBannerAutomatically() async {
    // This method changes current logo using a countdown
    CountdownTimer timer = CountdownTimer(const Duration(hours: 24), const Duration(seconds: 2));
    var listener = timer.listen(null);
    int counter = 0;

    listener.onData((data) {
      if (counter == 5){
        defaultLogo ? defaultLogo = false : defaultLogo = true;
        defaultLogo ? logoUri = "assets/logos/vdark.png" : logoUri = "assets/logos/vlight.png";
        counter = 0;
        notifyListeners();
      } else {
        counter ++;
      }
    });
  }

  void getCurrentMenuEntries() async {
    // A method that retrieve a list of existing menu entries
    try {
      menus = await Menus.retrieveExistingMenus();
    } catch (e){
      MenusData.insertMenusEntries();
      menus = await Menus.retrieveExistingMenus();
      print(menus);
    }

    // Refresh UI
    notifyListeners();
  }


}