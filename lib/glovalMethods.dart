import 'package:flutter/cupertino.dart';

// Global methods to return values for device-specific screen size


getDeviceHeight(BuildContext context){
  // Return current max height
  return MediaQuery.of(context).size.height;
}

getDeviceWidth(BuildContext context){
  // Return current max width
  return MediaQuery.of(context).size.width;
}



