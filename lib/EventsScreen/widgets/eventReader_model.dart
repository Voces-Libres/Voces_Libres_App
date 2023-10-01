import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiver/async.dart';
import 'package:stacked/stacked.dart';
import '../../exports.dart';
import 'package:super_clipboard/super_clipboard.dart';
import 'package:quiver/time.dart';

class EventReaderModel extends HomeScreenModel implements Initialisable{

  @override
  bool isClipboardUsed = false;

  final clipboard = DataWriterItem();

  @override
  bool isDarkModeEnabled = false;

  @override
  void initialise(){
  }

  Future<void> enableClipBoardAnimation(BuildContext context, String title, String header, String image, String body, String footer) async {
    // Enable a clipboard animation to user UI
    CountdownTimer timer = CountdownTimer(Duration(seconds: 5), Duration(seconds: 1));
    var listener = timer.listen(null);
    int counter = 0;
    SnackBar message = SnackBar(content: Text("Texto copiado al portapapeles", style: TextStyle(color: super.getDarkModeState() ? Colors.black :  Colors.white,), textAlign: TextAlign.center,), backgroundColor: super.getDarkModeState() ? Colors.white :  Colors.black, behavior: SnackBarBehavior.floating,);
    final data = await rootBundle.load(image);
    final buffer = data.buffer;

    // Write message to clipboard
    clipboard.add(Formats.plainText("$title\n\n$header\n\n$body\n$footer"));
    clipboard.add(Formats.png(buffer.asUint8List(data.offsetInBytes, data.lengthInBytes)));
    await ClipboardWriter.instance.write([clipboard]);

    // Show Toast
    ScaffoldMessenger.of(context).showSnackBar(message);

    // Show icon Animation
    listener.onData((data) {
      if (counter == 3){
        super.setClipboardState(false);
        notifyListeners();
      } else {
        counter++;
      }

    });
  }
}