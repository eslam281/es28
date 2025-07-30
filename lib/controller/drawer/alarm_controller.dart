

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:get/get.dart';

import '../../core/functions/getOfFajr.dart';
import '../../core/services/alarm_service.dart';
import '../../main.dart';

abstract class AlarmController extends GetxController{

}
class AlarmControllerImp extends AlarmController{
  bool ison = false;
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
      DateTime nextFajr =await getDataOfFajr();
      // AndroidAlarmManager.oneShotAt(nextFajr, 1,alarm,
      //     rescheduleOnReboot: true,allowWhileIdle: true,
      //     exact: true,wakeup: true
      // );
      AndroidAlarmManager.oneShot(const Duration(seconds: 5), 1,alarm,
          rescheduleOnReboot: true,allowWhileIdle: true,
          exact: true,wakeup: true
      );
    }else{
      AndroidAlarmManager.cancel(1);
    }
    update();
  }
}