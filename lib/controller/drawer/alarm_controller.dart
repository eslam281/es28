


import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:get/get.dart';

import '../../core/services/alarm_service.dart';
import '../../core/services/background_service.dart';
import '../../main.dart';

abstract class AlarmController extends GetxController{

}
class AlarmControllerImp extends AlarmController{
  late bool ison ;
  @override
  void onInit() {
    ison = myBox?.get("ison")??false;
    super.onInit();
  }
  onChange(val) async {
    ison = val;
    myBox?.put("ison", ison);
    if(ison==true){
      print("00000000000000000$ison");
      AndroidAlarmManager.oneShotAt(DateTime.now().add(
          const Duration(seconds: 20)),
          2,alarm,
          rescheduleOnReboot: true,allowWhileIdle: true,alarmClock: true,
          exact: true,wakeup: true
      );
      // if (!await FlutterBackgroundService().isRunning()) {
      //   await initializeService();
      //   await FlutterBackgroundService().startService();
      // }
      // FlutterBackgroundService().invoke("setAsBackground");
    }else{
      print("00000000000000000$ison");
      AudioPlayer().stop();
      AndroidAlarmManager.cancel(1);
      AndroidAlarmManager.cancel(2);
      // FlutterBackgroundService().invoke("stopService");
    }
    update();
  }
}