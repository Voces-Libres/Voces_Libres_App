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
  String latestEventImage = "";

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

    print(events);
    getLatestEvent();

  }

  getLatestEvent(){
    // This method gets latest event based on current day and month

   var currentDay = DateTime.now().day;
   var currentMonth = DateTime.now().month;

   var latestEvent;

    for (Events event in events){
      if (event.month == currentMonth || int.parse(event.month) > currentMonth){
        if (event.day == currentDay || int.parse(event.day) > currentDay ){
          latestEventImage = event.image;
          notifyListeners();
        } else if (int.parse(event.day) < currentDay && currentMonth < int.parse(event.month)){
          latestEventImage = event.image;
          notifyListeners();
        }
      }
    }

    print("image : $latestEventImage");

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