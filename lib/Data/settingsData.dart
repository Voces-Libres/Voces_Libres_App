import '../exports.dart';

class SettingsData{

  static Map<String,dynamic> settingsMap = {
    "Modo Oscuro" :  "disabled",
  };

  static insertSettings() async {
    for (String setting in settingsMap.keys){
      try {
        Settings.insertSetting(Settings(name: setting, value: settingsMap[setting]));
      } catch (e){
        Settings.createSettingsTable();
        Settings.insertSetting(Settings(name: setting, value: settingsMap[setting]));
      }
    }
  }
}