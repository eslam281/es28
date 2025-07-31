import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:audioplayers/audioplayers.dart';

import '../functions/getOfFajr.dart';

@pragma("vm:entry-point")
void alarm()async{

  final player = AudioPlayer(playerId: "Fajr");
 await player.setSourceAsset(
    "audio/Abdul_Basit_Abdul_Samad.mp3", // تأكد أنك وضعت الملف في assets
  );
  await player.resume();
  DateTime nextFajr =await getDataOfFajr();
  await AndroidAlarmManager.oneShotAt(nextFajr, 1,
    alarm, wakeup: true, exact: true,
    allowWhileIdle: true, rescheduleOnReboot: true,
  );
  print(" AndroidAlarmManager.oneShotAt 00000000000000000000000000000000");
}