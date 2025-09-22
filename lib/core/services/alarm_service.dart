import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter_background_service/flutter_background_service.dart';

import '../functions/getOfFajr.dart';


void alarm()async{
   FlutterBackgroundService flutterBackgroundService = await FlutterBackgroundService();
   flutterBackgroundService.invoke('setAsForeground');

  DateTime nextFajr =await getDataOfFajr();
  await AndroidAlarmManager.oneShotAt(nextFajr, 1,
    alarm, wakeup: true, exact: true,alarmClock: true,
    allowWhileIdle: true, rescheduleOnReboot: true,
  );
  print(" AndroidAlarmManager.oneShotAt 00000000000000000000000000000000");
}
