


import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../core/services/alarm_service.dart';
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
  @override
  void onReady() async{
    await Permission.scheduleExactAlarm.request();
    await Permission.notification.request();
    // await Permission.ignoreBatteryOptimizations.request();

    super.onReady();
  }
  onChange(val) async {
    ison = val;
    myBox?.put("ison", ison);
    if(ison==true){
      print("00000000000000000$ison");
      AndroidAlarmManager.oneShotAt(DateTime.now().add(
          const Duration(seconds: 15)),
          2,alarm,
          rescheduleOnReboot: true,allowWhileIdle: true,alarmClock: true,
          exact: true,wakeup: true
      );
    }else{
      print("00000000000000000$ison");
      AudioPlayer(playerId: "Fajr").stop();
      AndroidAlarmManager.cancel(1);
      AndroidAlarmManager.cancel(2);
    }
    update();
  }
}